class Question < ApplicationRecord
  belongs_to :test

  has_many :answers

  validates :body, presence: true,
                   uniqueness: { scope: :test_id, message: "this question already exists in this test" }
end
