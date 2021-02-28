class AddEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column(:users, :email, :text, null: false)
  end
end
