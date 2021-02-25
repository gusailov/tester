class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
