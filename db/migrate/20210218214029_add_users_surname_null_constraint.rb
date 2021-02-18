class AddUsersSurnameNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :surname, false)
  end
end
