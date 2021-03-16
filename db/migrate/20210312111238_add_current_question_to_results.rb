class AddCurrentQuestionToResults < ActiveRecord::Migration[6.1]
  def change
    add_reference(:results, :current_question, foreign_key: { to_table: :questions })
  end
end
