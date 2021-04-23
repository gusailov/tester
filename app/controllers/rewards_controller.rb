class RewardsController < ApplicationController
  def index
    @rewards = current_user.rewards
  end

 

  private

  def find_reward
    @reward = Reward.find(params[:id])
  end

  def set_reward
    @rewards = Reward.all
  end

  def reward_params
    params.require(:reward).permit(:title, :rule_type, :rule_value, :img_title)
  end
end