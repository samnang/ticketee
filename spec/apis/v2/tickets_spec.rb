require "spec_helper"

describe "/api/v2/tickets", :type => :api do
  let(:project) { Factory(:project, :name => "Ticketee") }
  let(:user) { create_user! }
  let(:token) { user.authentication_token }

  before do
    user.permissions.create!(:action => "view", :thing => project)
  end


  context "pagination" do
    before do
      100.times { Factory(:ticket, :project => project, :user => user) }
    end

    it "gets the first page" do
      get "/api/v2/projects/#{project.id}/tickets.json", :token => token, :page => 1

      last_response.body.should eql(project.tickets.page(1).per(50).to_json)
    end

    it "gets the second page" do
      get "/api/v2/projects/#{project.id}/tickets.json", :token => token, :page => 2

      last_response.body.should eql(project.tickets.page(2).per(50).to_json)
    end
  end
end
