class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    elsif resource_class == Shop
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    else
      super
    end
  end

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

  def sign_in_required
    redirect_to new_shop_session_url unless shop_signed_in?
  end

end
