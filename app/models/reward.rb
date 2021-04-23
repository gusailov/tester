class Reward < ApplicationRecord
  REWARDS_RULES = { I18n.t('.success_test_count') => 'success_test_count',
                    I18n.t('.tests_of_category') => 'tests_of_category',
                    I18n.t('.tests_of_level') => 'tests_of_level',
                    I18n.t('.first_try_pass') => 'first_try_pass' }.freeze

  has_many :users_rewards
  has_many :users, through: :users_rewards

  scope :success_test_count, -> {
                               where(rule_type: 'success_test_count') 
                             }
  scope :tests_of_category, ->(value) {
                              where(rule_type: 'tests_of_category') && where(rule_value: value)
                            }
  scope :tests_of_level, ->(value) {
                           where(rule_type: 'tests_of_level') && where(rule_value: value)
                         }
  scope :first_try_pass, -> { where(rule_type: 'first_try_pass') }
end
