require 'sinatra'
require_relative 'ticket'

class App < Sinatra::Base

	queue = []

	# Pages

	get '/' do
		erb :index, :locals => { :ticket_filed => false }
	end

	post '/' do
		if params[:name].length > 0
			ticket = Ticket.new params[:name], params[:reason]
			queue << ticket
			erb :index, :locals => {
				:ticket_filed => true,
				:name => ticket.name,
				:created => ticket.created,
				:reason => ticket.reason
			}
		else
			redirect '/'
		end
	end

	get '/tickets' do
		erb :tickets, :locals => { :queue => queue }
	end

end

# Only run it when called as `ruby your_app_file.rb`
App.run! if $0 == __FILE__
