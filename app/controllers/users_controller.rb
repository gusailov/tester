class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :surname, :dob, :email, :role)
  end
end
