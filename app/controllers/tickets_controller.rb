# Manages Tickets and their public interfaces.
class TicketsController < ApplicationController
  before_filter :authenticate, only: [:index, :destroy, :destroy_all, :find_ticket]

  respond_to :html, :json

  # Lists all Tickets in the database.
  #
  # GET /tickets
  # GET /tickets.json
  #
  # @return [String] the HTML/JSON for the Tickets page
  def index
    @tickets = Ticket.all

    respond_with @tickets
  end

  # Renders a new Ticket JSON.
  #
  # GET /tickets/new
  # GET /tickets/new.json
  #
  # @return [String] the HTML/JSON for the new Ticket
  def new
    @ticket = Ticket.new

    respond_with @ticket
  end

  # Creates and saves a new Ticket.
  #
  # POST /tickets
  # POST /tickets.json
  #
  # @return [String] the HTML/JSON for the saved Ticket
  def create
    @ticket = Ticket.new ticket_params

    respond_with @ticket do |format|
      if @ticket.save
        format.html { redirect_to '/' }
      else
        format.html { render 'new' }
      end
    end
  end

  # Deletes a Ticket from the database.
  #
  # DELETE /tickets/1
  # DELETE /tickets/1.json
  #
  # @return [String] the HTML/JSON notifying the user that the Ticket was
  # destroyed
  def destroy
    @ticket = Ticket.find params[:id]
    @ticket.destroy

    respond_with @ticket do |format|
      format.html { redirect_to '/list' }
    end
  end

  # Deletes all Tickets from the database and brings the user back to the Ticket
  # list.
  #
  # GET /destroy_all
  # GET /destroy_all.json
  def destroy_all
    Ticket.delete_all
    redirect_to '/list'
  end

  private

  # Use this method to whitelist the permissible parameters. Example:
  # params.require(:person).permit(:name, :age)
  # Also, you can specialize this method with per-user checking of permissible attributes.
  def ticket_params
    params.require(:ticket).permit(:name, :computer, :reason)
  end

end
