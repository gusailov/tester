class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def test_passage(test)
    results.order(created_at: :desc).find_by(test_id: test.id)
  end

  private

  def tests_with_level(level)
    tests.with_level(level)
  end
end
