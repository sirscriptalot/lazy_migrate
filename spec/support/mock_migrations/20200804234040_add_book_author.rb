class AddBookAuthor < ActiveRecord::Migration[5.2]
  def up
    add_column :books, :author, :string
  end

  def down
    remove_column :books, :author, :string
  end
end