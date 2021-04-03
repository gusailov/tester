class SessionsController < Devise::SessionsController
  after_action :greeting, only: :create

  private

  def greeting
    flash[:info] = "Hello, #{current_user.name}"
  end

  def after_sign_in_path_for(current_user)
    if current_user.admin?
      admin_root_path
    else
      stored_location_for(current_user) || root_path
    end
  end
end
