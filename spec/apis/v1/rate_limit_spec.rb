require "spec_helper"

describe "rate limiting", :type => :api do
  let(:user) { create_user! }

  it "counts the user's requests" do
    user.request_count.should eql(0)

    get '/api/v1/projects.json', :token => user.authentication_token

    user.reload
    user.request_count.should eql(1)
  end
end
