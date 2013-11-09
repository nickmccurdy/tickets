# This file is used by Rack-based servers to start the application.

# Enable gzip compression
use Rack::Deflater

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
