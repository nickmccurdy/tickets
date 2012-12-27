require 'data_mapper'

class Ticket

	include DataMapper::Resource

	property :id, Serial
	property :name, String
	property :created, Time, default: Time.now # broken, try to update this
	property :resolved, Boolean, default: false
	property :reason, String

	def resolve
		@resolved = true
	end

	def to_s
		"#{@name} at #{@created} for #{@reason} [#{@resolved? 'resolved' : 'pending'}]"
	end

end
