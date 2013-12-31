# Manages Tickets and their public HTML interfaces.
class TicketsController < ApplicationController
  before_filter :authenticate, only: [:index, :destroy_all]

  respond_to :html

  # Lists all Tickets in the database. Requires authentication.
  #
  # GET /admin
  #
  # @return [String] the HTML for the Ticket list (which is also the admin page)
  def index
    @tickets = Ticket.all
  end

  # Shows a user's Ticket. If the user does not have a Ticket open, it lets the
  # user create a new one.
  #
  # GET /
  #
  # @return [String] the HTML for the Ticket (or the new Ticket page)
  def show
    unless @ticket = Ticket.where(computer: session[:computer]).first
      @ticket = Ticket.new name: session[:name], computer: session[:computer]
      render 'new'
    end
  end

  # Creates and saves a new Ticket. If the Ticket is invalid, it lets the user
  # create a new Ticket.
  #
  # POST /
  #
  # @return [String] the HTML for the newly saved Ticket (or the new Ticket
  #   page)
  def create
    @ticket = Ticket.new ticket_params

    respond_to do |format|
      if @ticket.save
        session[:name] = @ticket.name
        session[:computer] = @ticket.computer
        format.html { redirect_to @ticket }
      else
        format.html { render 'new' }
      end
    end
  end

  # Destroys a Ticket from the database (if it's in the database).
  #
  # DELETE /1
  #
  # @return [String] a redirect to the previous page (or / if there were none)
  def destroy
    @ticket = Ticket.find params[:id]
    @ticket.destroy
  rescue ActiveRecord::RecordNotFound
  ensure
    redirect_to(request.referer || ticket_path)
  end

  # Destroys all Tickets from the database. Requires authentication.
  #
  # GET /destroy_all
  #
  # @return [String] a redirect to the previous page (or / if there were none)
  def destroy_all
    # Note: It is preferred to use delete_all instead of destroy_all here.
    # destroy_all has to instantiate and destroy every Ticket individually,
    # which is very expensive.
    Ticket.delete_all

    redirect_to(request.referer || ticket_path)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:name, :computer, :reason)
  end

end
