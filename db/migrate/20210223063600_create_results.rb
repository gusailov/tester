class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :test, foreign_key: true, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
