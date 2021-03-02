class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user

  validates :user_id, uniqueness: { scope: :test_id, message: "you cannot pass this test twice" }
end
