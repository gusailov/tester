class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.integer :question_id
      t.boolean :true_false

      t.timestamps
    end
  end
end
