class AddCountdownToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :countdown, :integer, default: 0, null: false
  end
end
