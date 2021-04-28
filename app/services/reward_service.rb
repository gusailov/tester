class RewardService
  REWARDS_RULES = { I18n.t('.success_test_count') => 'success_test_count',
                    I18n.t('.tests_of_category') => 'tests_of_category',
                    I18n.t('.tests_of_level') => 'tests_of_level',
                    I18n.t('.first_try_pass') => 'first_try_pass' }.freeze

  def initialize(user)
    @user = user
  end

  def reward_check
    r = Reward.all
    r.each do |reward|
      next if @user.rewards.include?(reward)
      next unless send("#{reward.rule_type}?", reward)

      @user.rewards.push(reward)
    end
  end

  private

  def success_tests
    @user.test_passages.filter(&:success?).map(&:test)
  end

  def success_test_count?(reward)
    success_tests.length.to_s == reward.rule_value.to_s
  end

  def tests_of_category?(reward)
    success_tests.filter do |st|
      st.category.title == reward.rule_value
    end.eql?(Test.by_category(reward.rule_value).to_a)
  end

  def first_try_pass?(reward)
    success_tests.count do |st|
      st.title == reward.rule_value
    end == 1 && @user.tests.count do |t|
                  t.title == reward.rule_value
                end == 1
  end

  def tests_of_level?(reward)
    success_tests.filter do |st|
      st.level == Test::TEST_LEVELS.invert[reward.rule_value.to_sym]
    end.eql?(Test.send(reward.rule_value).to_a)
  end
end
