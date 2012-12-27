class Ticket

	attr_reader :name, :created

	def initialize name
		@name = name
		@created = Time.now
	end

	def to_s
		"#{@name} at #{@created}"
	end

end
