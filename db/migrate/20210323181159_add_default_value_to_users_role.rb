class AddDefaultValueToUsersRole < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:users, :role, 'User')
  end
end
