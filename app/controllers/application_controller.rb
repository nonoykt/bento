class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(users)
    users_show_path
  end

  protected

  def sign_in_required
    redirect_to new_user_session_url unless user_sign_in?
  end

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    elsif resource_class == Shop
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    else
      super
    end
  end

end
