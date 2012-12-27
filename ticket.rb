class Ticket

	attr_reader :name, :created, :resolved

	def initialize name
		@name = name
		@created = Time.now
		@resolved = false
	end

	def resolve
		@resolved = true
	end

	def to_s
		"#{@name} at #{@created} [#{@resolved? 'resolved' : 'pending'}]"
	end

end
