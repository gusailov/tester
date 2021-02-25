class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author
  has_many :questions
  has_many :results
  has_many :users, through: :results
end
