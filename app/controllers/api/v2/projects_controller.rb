class Api::V2::ProjectsController < Api::V1::BaseController
  def index
    projects = Project.for(current_user)
    respond_with(projects, :except => :name, :methods => :title)
  end
end
