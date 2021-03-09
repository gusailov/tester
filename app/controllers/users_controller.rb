class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # render plain: "#{user_params}"
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :dob, :email, :role)
    #params[:]
  end
end
