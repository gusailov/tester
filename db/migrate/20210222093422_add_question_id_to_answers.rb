class AddQuestionIdToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :answers, :questions
    add_index :answers, :question_id
  end
end
