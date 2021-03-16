class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end

  private

  def tests_with_level(level)
    tests.with_level(level)
  end
end
