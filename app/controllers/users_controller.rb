class UsersController < ApplicationController
  before_action :find_user, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_user_not_found

  def show
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def rescue_with_user_not_found
    redirect_to root_path, alert: 'User was not found'
  end
end
