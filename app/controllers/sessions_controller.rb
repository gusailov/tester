class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      redirect_to login_path, alert: 'You are not logged in SessionsController'
    end
  end
end