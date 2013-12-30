# A Ticket created by a user. Tickets are destroyed when they are resolved,
# and cannot be modified. Every ticket has an owner name, a computer
# number representing the computer it was filed at, and reason for its filing.
class Ticket < ActiveRecord::Base
  default_scope { order 'created_at ASC' }

  validates :name,
    presence: true
  validates :computer,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 21 },
    uniqueness: true
  validates :reason,
    presence: true,
    inclusion: ['help', 'lab completed']

  # Gets the position of the current Ticket in the queue of all open Tickets,
  # starting at 1.
  #
  # @return [Integer] number of Tickets created before the current Ticket + 1
  def position
    Ticket.where('created_at < (?)', created_at).count + 1
  end
end
