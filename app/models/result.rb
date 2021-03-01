class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user

  validates :test, uniqueness: { scope: :user, message: "you cannot pass this test twice" }
end
