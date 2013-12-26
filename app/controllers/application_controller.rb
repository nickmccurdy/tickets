# Manages the application.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # TODO: Remove this for security purposes
  skip_before_filter :verify_authenticity_token

  protected

  # Ensures that the user is authenticated with the admin user and password.
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Tickets::Application.config.username &&
        password == Tickets::Application.config.password
    end
  end

end
