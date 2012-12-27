require 'sinatra'
require_relative 'ticket'

class App < Sinatra::Base

	queue = []

	# Pages

	get '/' do
		@ticket_filed = false
		erb :index
	end

	post '/' do
		if params[:name].length > 0
			@ticket_filed = true
			@ticket = Ticket.new params[:name], params[:reason]
			queue << @ticket
			erb :index
		else
			redirect '/'
		end
	end

	get '/tickets' do
		@queue = queue
		erb :tickets
	end

end

# Only run it when called as `ruby your_app_file.rb`
App.run! if $0 == __FILE__
