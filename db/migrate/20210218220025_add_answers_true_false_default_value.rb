class AddAnswersTrueFalseDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :true_false, true)
  end
end
