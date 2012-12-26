require 'sinatra'

class App < Sinatra::Base

	# Pages

	get '/' do
		erb :index
	end

	get '/requests' do
		erb :requests
	end

end

# Only run it when called as `ruby your_app_file.rb`
App.run! if $0 == __FILE__
