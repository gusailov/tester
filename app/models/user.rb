class User < ApplicationRecord
  self.inheritance_column = 'role'
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :gists
  has_many :users_rewards
  has_many :rewards, through: :users_rewards, dependent: :destroy

  validates :email, presence: true, uniqueness: true,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, presence: true

  after_update :after_update_reward_check

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def after_update_reward_check
    success_tests = test_passages.filter { |tp| tp.success? }
    rewards = Reward.all

    if success_tests.length == 1
      reward = rewards.success_test_count.find_by rule_value: '1'
      users_rewards.create(reward_id: reward.id)
    end
    if success_tests.length == 3
      reward = rewards.success_test_count.find_by rule_value: '5'
      users_rewards.create(reward_id: reward.id)
    end
  end

  private

  def tests_with_level(level)
    tests.with_level(level)
  end
end
