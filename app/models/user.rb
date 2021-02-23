class User < ApplicationRecord
  def user_tests(level)
    Result.select(user_id: id).joins(:tests).where(test: { level: level })
  end
end
