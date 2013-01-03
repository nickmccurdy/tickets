require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
	setup do
		@ticket = tickets(:one)
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:tickets)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create ticket" do
		assert_difference('Ticket.count') do
			post :create, ticket: { computer: @ticket.computer, reason: @ticket.reason }
		end

		assert_redirected_to ticket_path(assigns(:ticket))
	end

	test "should show ticket" do
		assert_raise ActionController::RoutingError do
			get :show, id: @ticket
			assert_response :success
		end
	end

	test "should get edit" do
		assert_raise ActionController::RoutingError do
			get :edit, id: @ticket
			assert_response :success
		end
	end

	test "should update ticket" do
		assert_raise ActionController::RoutingError do
			put :update, id: @ticket, ticket: { computer: @ticket.computer, reason: @ticket.reason }
			assert_redirected_to ticket_path(assigns(:ticket))
		end
	end

	test "should destroy ticket" do
		assert_difference('Ticket.count', -1) do
			delete :destroy, id: @ticket
		end

		assert_redirected_to tickets_path
	end
end
