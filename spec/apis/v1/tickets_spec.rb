require "spec_helper"

describe "/api/v1/tickets", :type => :api do
  let(:project) { Factory(:project, :name => "Ticketee") }
  let(:user) { create_user! }
  let(:token) { user.authentication_token }

  before do
    user.update_attribute(:admin, true)
    user.permissions.create!(:action => "view", :thing => project)
  end


  context "index" do
    before do
      5.times do
        Factory(:ticket, :project => project, :user => user)
      end
    end

    let(:url) { "/api/v1/projects/#{project.id}/tickets" }

    it "XML" do
      get "#{url}.xml", :token => token
      
      last_response.body.should eql(project.tickets.to_xml)
    end

    it "JSON" do
      get "#{url}.json", :token => token
      
      last_response.body.should eql(project.tickets.to_json)
    end
  end
end
