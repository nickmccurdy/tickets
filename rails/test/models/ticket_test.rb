require 'test_helper'

class TicketTest < ActiveSupport::TestCase

  setup do
    @ticket1 = tickets :one
    @ticket2 = tickets :two
  end

  test 'should have accessible attributes' do
    assert_equal 'Finn', @ticket1.name
    assert_equal 10, @ticket1.computer
    assert_equal 'help', @ticket1.reason
  end

  test 'should be sorted by creation time (ascending)' do
    assert_equal [@ticket1, @ticket2], Ticket.all
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
    assert_equal 1, @ticket1.position
    assert_equal 2, @ticket2.position
  end

end
