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

  # Shows the page for the Ticket.
  #
  # GET /tickets/1
  # GET /tickets/1.json
  #
  # @return [String] the HTML/JSON for the Ticket
  def show
    if session[:computer] and @ticket = Ticket.where(computer: session[:computer]).first
      respond_with @ticket
    else
      @ticket = Ticket.new
      render 'new'
    end
  end

  # Creates and saves a new Ticket.
  #
  # POST /tickets
  # POST /tickets.json
  #
  # @return [String] the HTML/JSON for the saved Ticket
  def create
    @ticket = Ticket.new params[:ticket]

    respond_with @ticket do |format|
      if @ticket.save
        session[:computer] = @ticket.computer
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

    redirect_to(request.referer || '/')
  end

  # Deletes all Tickets from the database and brings the user back to the Ticket
  # list.
  #
  # GET /destroy_all
  # GET /destroy_all.json
  def destroy_all
    Ticket.delete_all

    redirect_to(request.referer || '/')
  end

end
