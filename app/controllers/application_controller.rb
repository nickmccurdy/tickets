# Manages the application.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  # Ensures that the user is authenticated with the admin user and password.
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == CONFIG['username'] && password == CONFIG['password']
    end
  end

end
