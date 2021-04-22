class Admin::RewardsController < Admin::BaseController
  before_action :set_reward, only: %i[index]
  before_action :find_reward, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to admin_rewards_path, notice: t('.success')
    else
      render :new
    end
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
