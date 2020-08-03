# frozen_string_literal: true

module LazyMigrate
  class OldMigrationAdapater
    # example: ['up', 20200715030339, 'Add unique index to table']
    def find_migration_tuples
      ActiveRecord::Migrator.migrations_status(base_paths)
    end

    def up(migration)
      ActiveRecord::Migrator.run(:up, ActiveRecord::Tasks::DatabaseTasks.migrations_paths, migration[:version])
    end

    def down(migration)
      ActiveRecord::Migrator.run(:down, ActiveRecord::Tasks::DatabaseTasks.migrations_paths, migration[:version])
    end

    def redo(migration)
      down(migration)
      up(migration)
    end

    def migrate(migration)
      ActiveRecord::Migrator.migrate(base_paths, migration[:version])
    end

    def rollback(migration)
      ActiveRecord::Migrator.migrate(base_paths, migration[:version])
    end

    def find_filename_for_migration(migration)
      migrations.find { |m| m.version == migration[:version] }&.filename
    end

    def last_version
      ActiveRecord::Migrator.get_all_versions.last
    end

    private

    def base_paths
      ActiveRecord::Tasks::DatabaseTasks.migrations_paths
    end

    def migration_files
      ActiveRecord::Migrator.migration_files(base_paths)
    end

    def migrations
      ActiveRecord::Migrator.migrations(base_paths)
    end
  end
end
