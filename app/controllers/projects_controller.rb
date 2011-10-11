class ProjectsController < ApplicationController
  before_filter :find_project, :except => [:index, :new, :create]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, :notice => "Project has been created."
    else
      flash[:alert] = "Project has not been created."
      render :new
    end
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice => "Project has been updated."
    else
      flash[:alert] = "Project has not been updated."
      render :edit
    end
  end

  def destroy
    @project.destroy

    redirect_to projects_path, :notice => "Project has been deleted."
  end
  
  private
  def find_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path, :alert => "The project you were looking for could not be found."
  end
end
