class Ticket < ActiveRecord::Base
  attr_accessible :open, :owner, :reason
end
