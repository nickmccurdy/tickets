require 'test_helper'

class TicketTest < ActiveSupport::TestCase

  setup do
    @ticket1 = tickets :one
    @ticket2 = tickets :two
  end

  test 'should have accessible attributes' do
    assert_equal @ticket1.name, 'Finn'
    assert_equal @ticket1.computer, 10
    assert_equal @ticket1.reason, 'help'
  end

  test 'should be sorted by creation time (ascending)' do
    assert_equal Ticket.all, [@ticket1, @ticket2]
  end

  test 'should validate name' do
    Ticket.create! name: 'Bob', computer: 1, reason: 'help'
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! computer: 2, reason: 'help', name: '' }
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! computer: 3, reason: 'help' }
  end

  test 'should validate computer' do
    Ticket.create! name: 'Bob', computer: 1, reason: 'help'
    Ticket.create! name: 'Bob', computer: 9, reason: 'help'
    Ticket.create! name: 'Bob', computer: 21, reason: 'help'
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! name: 'Bob', reason: 'help' }
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! name: 'Bob', computer: 1, reason: 'help' }
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! name: 'Bob', computer: 'two', reason: 'help' }
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! name: 'Bob', computer: 2.0, reason: 'help' }
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! name: 'Bob', computer: 0, reason: 'help' }
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! name: 'Bob', computer: -10, reason: 'help' }
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! name: 'Bob', computer: 22, reason: 'help' }
  end

  test 'should validate reason' do
    Ticket.create! name: 'Bob', computer: 1, reason: 'help'
    Ticket.create! name: 'Bob', computer: 2, reason: 'lab completed'
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! name: 'Bob', computer: 2 }
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! name: 'Bob', computer: 2, reason: '' }
    assert_raise(ActiveRecord::RecordInvalid) { Ticket.create! name: 'Bob', computer: 2, reason: 'yolo' }
  end

  test 'should get its position in the queue' do
    assert_equal @ticket1.position, 0
    assert_equal @ticket2.position, 1
  end

end
