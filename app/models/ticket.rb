class Ticket < ActiveRecord::Base
	attr_accessible :computer, :reason

	validates :computer, presence: true
	# Try to also ensure that the computer number is not empty

	def to_s
		"#{name} at #{created_at} for #{reason}"
	end
end
