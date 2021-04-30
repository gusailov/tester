class RewardService
  REWARDS_RULES = { I18n.t('.success_test_count') => 'success_test_count',
                    I18n.t('.tests_of_category') => 'tests_of_category',
                    I18n.t('.tests_of_level') => 'tests_of_level',
                    I18n.t('.first_try_pass') => 'first_try_pass' }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @rewards = []
  end

  def get_rewards
    r = Reward.all
    r.each do |reward|
      @rewards << reward if send("#{reward.rule_type}?", reward)
    end
    @rewards
  end

  private

  def success_tests
    @test_passage.user.success_tests
  end

  def success_test_count?(reward)
    success_tests.count == reward.rule_value
  end

  def tests_of_category?(reward)
    (Test.by_category(reward.rule_value).ids - success_tests.by_category(reward.rule_value).ids).empty?
  end

  def first_try_pass?(reward)
    (success_tests.find_by title: reward.rule_value) == 1 && (@user.tests.find_by title: reward.rule_value) == 1
  end

  def tests_of_level?(reward)
    (Test.send(reward.rule_value).ids - success_tests.send(reward.rule_value).ids)
  end
end
