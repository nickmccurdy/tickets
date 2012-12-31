require 'sinatra'
require 'data_mapper'
require_relative 'ticket'

class App < Sinatra::Base

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
		@ticket = Ticket.new name: params[:name], reason: params[:reason]
		@ticket_accepted = @ticket.save
		erb :index
	end

	get '/tickets' do
		@tickets = Ticket.all
		erb :tickets
	end

end

# Only run it when called as `ruby your_app_file.rb`
App.run! if $0 == __FILE__
