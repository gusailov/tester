class AddCorrectQuestionsToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :correct_question, :integer, default: 0, null: false
  end
end
