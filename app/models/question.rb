class Question < ApplicationRecord
  belongs_to :test

  has_many :answers

  validates :body, presence: true,
                   uniqueness: { scope: :test, message: "this question already exists" }
end
