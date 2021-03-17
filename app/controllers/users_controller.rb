class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :find_user, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_user_not_found

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user)
          .permit(:name, :surname, :dob, :email, :role, :password, :password_confirmation)
  end

  def rescue_with_user_not_found
    render plain: 'User was not found', status: :not_found
  end
end
