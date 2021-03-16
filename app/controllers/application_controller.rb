class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'You are not logged in'
    end

    cookies[:email] = {
      value: current_user&.email,
      expires: 1.month
    }
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
