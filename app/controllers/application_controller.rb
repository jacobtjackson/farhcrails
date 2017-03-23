class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_message

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_index_path
    elsif current_user.approved? && !current_user.admin?
      users_index_path
    else
      home_index_path
    end
  end

  def set_message
    @message = Message.new
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not authorized to access that page."
    redirect_to root_url
  end
end
