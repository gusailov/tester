class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(current_user)
    if current_user.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    registration_params = %i[name surname role dob(1i) dob(2i) dob(3i)]
    devise_parameter_sanitizer.permit(:sign_up, keys: registration_params)
    devise_parameter_sanitizer.permit(:edit, keys: registration_params)
  end
end
