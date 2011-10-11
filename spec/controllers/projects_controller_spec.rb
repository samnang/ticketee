require 'spec_helper'

describe ProjectsController do
  it "displays an error for a mising project" do
    get :show, :id => "not-there"

    response.should redirect_to(projects_path)
    flash[:alert].should == "The project you were looking for could not be found."
  end
end
