class AddCorrectQuestionsToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :correct_questions, :integer, default: 0, null: false
  end
end
