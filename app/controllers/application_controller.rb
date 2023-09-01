# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActionController::RoutingError, with: :route_not_found

  private

  def user_not_authorized
    flash[:alert] = t(:unauthorized)
    redirect_to(request.referer || authenticated_root_path)
  end

  def route_not_found
    render 'public/404', layout: false, status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username name age gender image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username name age gender image])
  end
end
