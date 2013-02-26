require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Sets up login credentials to successfully access the admin page.
  def supply_login_credentials
    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64::encode64('admin:password')
  end
end
