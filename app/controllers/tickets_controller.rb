# Manages Tickets and their public interfaces.
class TicketsController < ApplicationController
  before_filter :authenticate, except: [:new, :create] unless Rails.env == 'test'

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
    @ticket = Ticket.find(params[:id])

    respond_with @ticket
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

  # Edits the values of a Ticket.
  #
  # GET /tickets/1/edit
  #
  # @return [String] the HTML/JSON for the Ticket edit page
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # Creates and saves a new Ticket.
  #
  # POST /tickets
  # POST /tickets.json
  #
  # @return [String] the HTML/JSON for the saved Ticket
  def create
    flash[:ticket] = @ticket = Ticket.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to '/' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates the values of a Ticket.
  #
  # PUT /tickets/1
  # PUT /tickets/1.json
  #
  # @return [String] the HTML/JSON for the updated Ticket
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
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
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to '/list' }
      format.json { head :no_content }
    end
  end

  # Deletes all Tickets from the database and brings the user back to the Ticket
  # list.
  #
  # GET /destroy_all
  # GET /destroy_all.json
  def destroy_all
    Ticket.delete_all
    #flash[:notice] = "You have removed all results!"
    redirect_to '/list'
  end
end
