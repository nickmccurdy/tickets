class Ticket < ActiveRecord::Base
	attr_accessible :owner, :reason

	validates :owner, :presence => true
	# Try to also ensure that the name is not empty

	def to_s
		"#{name} at #{created_at} for #{reason}"
	end
end
