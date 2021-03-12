class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  validates :user_id, uniqueness: { scope: :test_id, message: "you cannot pass this test twice" }
end
