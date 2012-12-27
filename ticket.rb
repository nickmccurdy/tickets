class Ticket

	attr_reader :name, :created, :resolved, :reason

	def initialize name, reason
		@name = name
		@created = Time.now
		@resolved = false
		@reason = reason
	end

	def resolve
		@resolved = true
	end

	def to_s
		"#{@name} at #{@created} for #{@reason} [#{@resolved? 'resolved' : 'pending'}]"
	end

end
