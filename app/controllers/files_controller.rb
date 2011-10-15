class FilesController < ApplicationController
  before_filter :authenticate_user!

  def show
    asset = Asset.find(params[:id])
    
    if can?(:view, asset.ticket.project)
      send_file asset.asset.path, :file_name => asset.asset_file_name,
                                  :content_type => asset.asset_content_type
    else
      redirect_to root_path, :alert => "The asset you were looking for could not be found."
    end
  end
end
