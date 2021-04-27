class Reward < ApplicationRecord
  has_many :users_rewards
  has_many :users, through: :users_rewards

  validates :title, presence: true
  validates :rule_value, presence: true
  validates :img_title, presence: true
end
