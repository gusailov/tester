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
    r = Reward.all
    r.each do |reward|
      next if  rewards.include?(reward)
      next unless send("#{reward.rule_type}?", reward)

      rewards.push(reward)
    end
  end

  def success_tests
    test_passages.filter(&:success?).map(&:test)
  end

  private

  def success_test_count?(reward)
    success_tests.length.to_s == reward.rule_value.to_s
  end

  def tests_of_category?(reward)
    success_tests.filter do |st|
      st.category.title == reward.rule_value
    end.eql?(Test.by_category(reward.rule_value).to_a)
  end

  def tests_of_level?
    success_tests.filter do |st|
      st.level == reward.rule_value
    end.eql?(Test.with_level(reward.rule_value))
  end

  def tests_with_level(level)
    tests.with_level(level)
  end
end
