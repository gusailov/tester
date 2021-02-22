class AddTestIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :questions, :tests
    add_index :questions, :test_id
  end
end
