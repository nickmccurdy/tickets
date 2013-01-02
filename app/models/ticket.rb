class Ticket < ActiveRecord::Base
	attr_accessible :computer, :reason

	validates :computer, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 21 }, uniqueness: { scope: :reason, message: 'only one ticket per reason per computer is allowed' }
	validates :reason, presence: true, inclusion: ['help', 'lab completed']

	def to_s
		"#{name} at #{created_at} for #{reason}"
	end
end
