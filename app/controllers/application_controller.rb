class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :fac, :formation, :niveau, :password, :email, :password_confirmation) }
  end

def after_sign_in_path_for(resource_or_scope)
 current_user
end


end
