require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  setup do
    supply_login_credentials
    @ticket = tickets :one
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns :tickets
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create ticket' do
    # Note that using fixtures for the new ticket's data won't work here,
    # since that fixture's data is already in the database, causing validation
    # errors

    assert_difference 'Ticket.count' do
      post :create, ticket: { name: 'Fred', computer: 5, reason: 'help' }
    end
    assert_redirected_to '/'

    assert_no_difference 'Ticket.count' do
      post :create, ticket: { name: 'Not Fred', computer: 6, reason: 'idk bro' }
    end
    assert_response :success
  end

  test 'should NOT show ticket' do
    assert_raise ActionController::RoutingError do
      get :show, id: @ticket
      assert_response :success
    end
  end

  test 'should NOT get edit' do
    assert_raise ActionController::RoutingError do
      get :edit, id: @ticket
      assert_response :success
    end
  end

  test 'should NOT update ticket' do
    assert_raise ActionController::RoutingError do
      put :update, id: @ticket, ticket: { name: @ticket.name, computer: @ticket.computer, reason: @ticket.reason }
      assert_redirected_to ticket_path assigns :ticket
    end
  end

  test 'should destroy ticket' do
    assert_difference 'Ticket.count', -1 do
      delete :destroy, id: @ticket
    end
    assert_redirected_to '/list'
  end

  test 'should destroy all tickets' do
    get :destroy_all
    assert_equal Ticket.count, 0
    assert_redirected_to '/list'
  end
end
