require 'sinatra'
require_relative 'ticket'

class App < Sinatra::Base

	queue = []

	# Pages

	get '/' do
		erb :index
	end

	post '/' do
		queue << Ticket.new(params[:name])
		"Your ticket has been filed under the name \"#{params[:name]}.\""
	end

	get '/tickets' do
		erb :tickets
	end

end

# Only run it when called as `ruby your_app_file.rb`
App.run! if $0 == __FILE__
