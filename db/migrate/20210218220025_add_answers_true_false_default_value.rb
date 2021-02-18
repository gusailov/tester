class AddAnswersTrueFalseDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:answers, :true_false, true)
  end
end
