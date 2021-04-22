class CreateRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards do |t|
      t.string :title, null: false
      t.string :rule_type, null: false
      t.string :rule_value, null: false
      t.string :img_title, null: false

      t.timestamps
    end
  end
end
