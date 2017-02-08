class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    binding.pry
    if resource.is_a?(User) && user_signed_in?
      user_task_lists_path(resource)
    else
      super
    end
  end
end
