class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id'

  def tests_with_level(level)
    Test.joins(:results).where('level = :level AND results.user_id = :id', level: level, id: id)
  end
end
