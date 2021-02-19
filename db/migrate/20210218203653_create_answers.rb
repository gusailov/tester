class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.integer :question_id
      t.boolean :correct, null: false, default: true

      t.timestamps
    end
  end
end
