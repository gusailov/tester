class AddAuthorIdToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :author_id, :integer, null: false
    add_foreign_key :tests, :users, column: :author_id
    add_index :tests, :author_id
  end
end
