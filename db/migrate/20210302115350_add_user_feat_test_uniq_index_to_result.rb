class AddUserFeatTestUniqIndexToResult < ActiveRecord::Migration[6.1]
  def change
    add_index :results, %i[user_id test_id], unique: true
  end
end
