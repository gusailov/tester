class RewardService
  REWARDS_RULES = { I18n.t('.success_test_count') => 'success_test_count',
                    I18n.t('.tests_of_category') => 'tests_of_category',
                    I18n.t('.tests_of_level') => 'tests_of_level',
                    I18n.t('.first_try_pass') => 'first_try_pass' }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def get_rewards
    Reward.all.select { |reward| reward if check_reward?(reward) }
  end

  def check_reward?(reward)
    unless @test_passage.user.rewards.include?(reward)
      send("#{reward.rule_type}?", reward.rule_value)
    end
  end

  private

  def success_tests
    @test_passage.user.success_tests
  end

  def success_test_count?(count)
    success_tests.count == count.to_i
  end

  def tests_of_category?(category_title)
    (Test.by_category(category_title).ids - success_tests.by_category(category_title).ids).empty?
  end

  def first_try_pass?(test_title)
    (success_tests.find_by title: test_title) == 1 && (@test_passage.user.tests.find_by title: test_title) == 1
  end

  def tests_of_level?(level)
    (Test.level_by_name(level).ids - success_tests.level_by_name(level).ids).empty?
  end
end
