class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_states

  private

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, :alert => "You must be an admin to do that."
    end
  end

  def find_states
    @states = State.all
  end
end
