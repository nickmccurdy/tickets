class Ticket < ActiveRecord::Base
	attr_accessible :computer, :reason

	validates :computer, presence: true, numericality: true, inclusion: 1..21, uniqueness: { scope: :reason, message: 'only one ticket per reason per computer is allowed' }
	validates :reason, presence: true, inclusion: ['help', 'lab completed']

	def to_s
		"#{name} at #{created_at} for #{reason}"
	end
end
