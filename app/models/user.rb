class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id'
end
