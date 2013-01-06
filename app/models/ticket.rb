class Ticket < ActiveRecord::Base
	attr_accessible :name, :computer, :reason

	default_scope order 'created_at ASC'

	validates :name, presence: true
	validates :computer, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 21 }, uniqueness: true
	validates :reason, presence: true, inclusion: ['help', 'lab completed']

	def position
		Ticket.where('created_at <= (?)', created_at).count
	end
end
