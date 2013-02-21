# Manages the application.
class ApplicationController < ActionController::Base

	protect_from_forgery

	protected

	# Ensures that the user is authenticated with the admin user and password.
	def authenticate
		authenticate_or_request_with_http_basic do |username, password|
			username == CONFIG['username'] && password == CONFIG['password']
		end
	end

end
