class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      url = cookies[:return_to] || root_path
      session[:user_id] = user.id
      redirect_to(url)
    else
      redirect_to login_path, alert: 'You are not logged in'
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.clear
    @current_user = nil
    redirect_to login_path, alert: 'You are logged out'
  end
end
