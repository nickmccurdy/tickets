require 'data_mapper'

class Ticket

	include DataMapper::Resource

	property :id, Serial, unique: true
	property :name, String, length: 1..50
	property :created_at, DateTime
	property :open, Boolean, default: true
	property :reason, String

	def close
		update open: false
	end

	def to_s
		"#{@name} at #{@created_at} for #{@reason}"
	end

end
