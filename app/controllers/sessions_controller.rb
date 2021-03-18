class SessionsController < ApplicationController
  def new
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
    cookies.clear
    @current_user = nil
    redirect_to login_path, alert: 'You are logged out'
  end
end
