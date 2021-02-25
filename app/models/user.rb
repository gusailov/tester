class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_one :author, -> { includes :tests }
 end
