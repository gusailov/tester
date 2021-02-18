class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.date :dob
      t.string :role

      t.timestamps
    end
  end
end
