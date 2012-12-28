require 'data_mapper'

class Ticket

	include DataMapper::Resource

	property :id, Serial
	property :name, String, required: true
	property :created_at, DateTime
	property :resolved, Boolean, default: false
	property :reason, String

	def resolve
		@resolved = true
	end

	def to_s
		"#{@name} at #{@created_at} for #{@reason} [#{@resolved? 'resolved' : 'pending'}]"
	end

end
