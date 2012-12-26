# Set up site
require './app'

# Set up middleware
use Rack::Deflater

# Run site
run App
