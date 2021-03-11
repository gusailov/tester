module TestsHelper
  def test_level(test)
    Test::TEST_LEVELS[test.level] || Test::TEST_LEVELS.values.last
  end
end
