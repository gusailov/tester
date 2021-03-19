class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:return_to] || root_path
    else
      flash.now[:alert] = 'You are not logged in'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, alert: 'You are logged out'
  end
end
