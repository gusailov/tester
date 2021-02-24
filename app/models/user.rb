class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  # def tests_with_level(level)
  #   Test.joins('JOIN results ON tests.id = results.test_id')
  #       .where('level = :level AND results.user_id = :id', level: level, id: id)
  # end
end
