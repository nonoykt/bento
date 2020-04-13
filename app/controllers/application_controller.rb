class ApplicationController < ActionController::Base
  helper_method :current_shop
  helper_method :current_user
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

  def current_shop
    @current_shop ||= Shop.find_by(id: session[:shop_id]) if session[:shop_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
