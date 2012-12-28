require 'sinatra'
require 'data_mapper'
require_relative 'ticket'

class App < Sinatra::Base

	# If you want the logs displayed you have to do this before the call to setup
	DataMapper::Logger.new $stdout, :debug
	# A Sqlite3 connection to a persistent database
	DataMapper::setup :default, "sqlite3://#{Dir.pwd}/tickets.db"
	# Set up default property options
	DataMapper::Property.required(true)
	# Finalize models
	DataMapper.finalize
	# Automatically create the ticket table
	DataMapper.auto_upgrade!

	# Pages

	get '/' do
		erb :index
	end

	post '/' do
		if params[:name].length > 0
			@ticket = Ticket.create name: params[:name], reason: params[:reason]
			erb :index
		else
			redirect '/'
		end
	end

	get '/tickets' do
		@tickets = Ticket.all
		erb :tickets
	end

end

# Only run it when called as `ruby your_app_file.rb`
App.run! if $0 == __FILE__
