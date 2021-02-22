class User < ApplicationRecord
  has_many :tests

  scope :user_tests, ->(level) { where('level= ?', level) }
  def user_tests(level)
    tests = Test.where(level: level)
    User.pluck(:results)
    Result.joins(:user_id)
  end
end
