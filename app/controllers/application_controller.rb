# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || authenticated_root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username name age gender])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username name age gender])
  end
end
