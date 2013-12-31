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

  test 'should create ticket' do
    # Note that using fixtures for the new ticket's data won't work here,
    # since that fixture's data is already in the database, causing validation
    # errors

    assert_difference 'Ticket.count' do
      post :create, ticket: { name: 'Fred', computer: 5, reason: 'help' }
    end
    assert_redirected_to ticket_path(assigns(:ticket))

    assert_no_difference 'Ticket.count' do
      post :create, ticket: { name: 'Not Fred', computer: 6, reason: 'idk bro' }
    end
    assert_response :success
  end

  test 'should show ticket' do
    get :show
    assert_response :success

    get :show, nil, computer: 10
    assert_response :success
  end

  test 'should destroy ticket' do
    assert_difference 'Ticket.count', -1 do
      delete :destroy, id: @ticket
    end
    assert_redirected_to ticket_path
  end

  test 'should destroy all tickets' do
    get :destroy_all
    assert_equal 0, Ticket.count
    assert_redirected_to ticket_path
  end
end
