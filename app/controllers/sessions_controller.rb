class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Hello, #{current_user.name}"
  end

  private

  def after_sign_in_path_for(current_user)
    if current_user.admin?
      admin_root_path
    else
      stored_location_for(current_user) || root_path
    end
  end
end
