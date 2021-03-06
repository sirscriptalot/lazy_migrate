# typed: strict
# frozen_string_literal: true

require 'lazy_migrate/migration'

module LazyMigrate
  class MigratorAdapter
    extend T::Sig
    extend T::Helpers

    abstract!

    sig { void }
    def initialize; end

    # bring_to_top updates the version of a migration to bring it to the top of the
    # migration list. If the migration had already been up'd it will mark the
    # new migration file as upped as well. The former version number will be
    # removed from the schema_migrations table. The user chooses whether
    # they want to down the migration before moving it.
    sig { params(migration: LazyMigrate::Migration, ask_for_rerun: T.proc.returns(T::Boolean)).void }
    def bring_to_top(migration:, ask_for_rerun:)
      initial_version = migration.version
      initial_status = migration.status
      initial_filename = self.find_filename_for_migration(migration)

      if initial_filename.nil?
        raise("No file found for migration #{initial_version}")
      end

      re_run = initial_status == 'up' && ask_for_rerun.()

      if re_run
        self.down(initial_version)
      end

      last = self.last_version
      new_version = ActiveRecord::Migration.new.next_migration_number(last ? last + 1 : 0).to_i
      new_filename = replace_version_in_filename(initial_filename, new_version)
      File.rename(initial_filename, new_filename)

      if re_run
        self.up(new_version)
      elsif initial_status == 'up'
        ActiveRecord::SchemaMigration.create(version: new_version)
        ActiveRecord::SchemaMigration.find_by(version: initial_version)&.destroy!
      end
    end

    sig { params(filename: String, new_version: Integer).returns(String) }
    def replace_version_in_filename(filename, new_version)
      basename = File.basename(filename)
      dir = File.dirname(filename)
      name_after_version = T.must(basename.split('_')[1..]).join('_')
      new_basename = "#{new_version}_#{name_after_version}"
      File.join(dir, new_basename)
    end

    sig { void }
    def dump_schema
      return if !ActiveRecord::Base.dump_schema_after_migration

      # ripped from https://github.com/rails/rails/blob/5-1-stable/activerecord/lib/active_record/railties/databases.rake
      filename = ENV["SCHEMA"] || File.join(ActiveRecord::Tasks::DatabaseTasks.db_dir, "schema.rb")
      File.open(filename, "w:utf-8") do |file|
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
      end
    end

    sig { returns(T::Array[LazyMigrate::Migration]) }
    def find_migrations
      self.load_migration_paths
      current_version = self.last_version

      self.find_migration_tuples
        .reverse
        .map { |status, str_version, name|
          # This depends on how rails reports a file is missing.
          # This is no doubt subject to change so be wary.
          has_file = name != '********** NO FILE **********'
          version = str_version.to_i
          current = version == current_version

          LazyMigrate::Migration.new(
            status: status,
            version: version,
            name: name,
            has_file: has_file,
            current: current,
          )
        }
    end

    sig { void }
    def load_migration_paths
      # silencing cos we might be re-initializing some constants and rails
      # doesn't like that
      Kernel.silence_warnings do
        ActiveRecord::Migrator.migrations_paths.each do |path|
          Dir[Rails.application.root.join("#{path}/**/*.rb")].each { |file| load file }
        end
      end
    end

    sig { params(arr: T::Array[Integer], value: Integer).returns(T.nilable(Integer)) }
    def previous_value(arr, value)
      arr.sort.select { |v| v < value }.last
    end

    sig { params(version: Integer).void }
    def remove_version_from_table(version)
      ActiveRecord::SchemaMigration.find_by!(version: version).destroy!
    end

    sig { abstract.params(version: Integer).void }
    def up(version); end

    sig { abstract.params(version: Integer).void }
    def down(version); end

    sig { abstract.params(version: Integer).void }
    def redo(version); end

    sig { abstract.params(version: Integer).void }
    def migrate(version); end

    sig { abstract.params(version: Integer).void }
    def rollback(version); end

    protected

    sig { abstract.returns(T::Array[[String, String, String]]) }
    def find_migration_tuples; end

    sig { abstract.params(version: Integer).returns(T.nilable(Integer)) }
    def find_previous_version(version); end

    sig { abstract.params(migration: LazyMigrate::Migration).returns(T.nilable(String)) }
    def find_filename_for_migration(migration); end

    sig { abstract.returns(T.nilable(Integer)) }
    def last_version; end
  end
end
