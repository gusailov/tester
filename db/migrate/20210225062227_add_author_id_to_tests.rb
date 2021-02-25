class AddAuthorIdToTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :author, foreign_key: true, null: false
  end
end
