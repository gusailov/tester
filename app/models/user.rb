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

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def reward_check
    rewards = Reward.all
    rewards.each do |reward|
      case
      when success_test_passages.length.to_s == reward.rule_value
        users_rewards.create(reward_id: reward.id)
      end
    end
  end

  def success_tests
    success_test_passages = test_passages.filter { |tp| tp.success? }

    success_test_passages.each do |t|
      tests << t.test
    end
  end

  private

  def tests_with_level(level)
    tests.with_level(level)
  end
end
