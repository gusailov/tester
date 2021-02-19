class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level, null: false, default: 0

      t.timestamps
    end
  end
end
