require 'spec_helper'

describe '/api/v2/projects', :type => :api do
  let(:user) { create_user! }
  let(:token) { user.authentication_token }

  before do
    @project = Factory(:project)
    user.permissions.create!(:action => "view", :thing => @project)
  end

  context "projects viewable by this user" do
    let(:url) { "/api/v2/projects" }
    let(:options) { {:except => :name, :methods => :title} }

    it "json" do
      get "#{url}.json", :token => token

      body = Project.for(user).all.to_json(options)
      last_response.body.should eql(body)
      last_response.status.should eql(200)

      projects = JSON.parse(last_response.body)

      projects.any? do |p|
        p["project"]["title"] == "Ticketee"
      end.should be_true

      projects.any? do |p|
        p["project"]["name"].blank?
      end.should be_true
    end

    it "xml" do
      get "#{url}.xml", :token => token

      body = Project.readable_by(user).to_xml(options)
      last_response.body.should eql(body)
      projects = Nokogiri::XML(last_response.body)
      projects.css("project title").text.should eql("Ticketee")
      projects.css("project name").text.should eql("")
    end
  end
end
