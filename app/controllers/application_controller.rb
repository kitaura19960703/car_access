class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_notifications, if: :user_signed_in?
  
  def after_sign_up_path_for(resource)
      users_path
  end

  def after_sign_out_path_for(resource)
      root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :age, :first_address, :last_address, :email, :password, :password_confirmation])
  end
  
  def get_notifications
   @notifications = current_user.notifications
  end
end
