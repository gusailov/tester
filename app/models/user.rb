class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true, uniqueness: true

  private

  def tests_with_level(level)
    tests.with_level(level)
  end
end
