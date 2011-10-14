require 'spec_helper'

describe ProjectsController do
  let(:user) do
    user = Factory(:user)
    user.confirm!
    user
  end
  let(:project) { Factory(:project) }

  context "standard users" do

    {
      new: :get,
      create: :post,
      edit: :get,
      update: :put,
      destroy: :delete,
    }.each do |action, method|
      it "can't access to #{action} action" do
        sign_in(user)
        send(method, action, :id => project.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that.")
      end
    end
  end

  it "displays an error for a mising project" do
    get :show, :id => "not-there"

    response.should redirect_to(projects_path)
    flash[:alert].should == "The project you were looking for could not be found."
  end
end
