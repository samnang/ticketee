module SeedHelpers
  def create_user!
    user = Factory(:user)
    user.confirm!

    user
  end
end

RSpec.configure do |config|
  config.include SeedHelpers
end
