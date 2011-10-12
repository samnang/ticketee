class TicketsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_project
  before_filter :find_ticket, :except => [:index, :new, :create]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(params[:ticket].merge(:user => current_user))
    if @ticket.save
      redirect_to [@project, @ticket], :notice => "Ticket has been created."
    else
      flash[:alert] = "Ticket has not been created."
      render :new
    end
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      redirect_to [@project, @ticket], :notice => "Ticket has been updated."
    else
      flash[:alert] = "Ticket has not been updated."
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to @project, :notice => "Ticket has been deleted."
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end
