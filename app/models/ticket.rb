class Ticket < ActiveRecord::Base
	attr_accessible :open, :owner, :reason

	after_initialize :set_defaults

	validates :owner, :presence => true
	# Try to also ensure that the name is not empty

	def set_defaults
		open ||= true
	end

	def to_s
		"#{name} at #{created_at} for #{reason}"
	end
end
