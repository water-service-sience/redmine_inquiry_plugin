class GeoInfoController < ApplicationController
  unloadable

  before_filter :find_project


  def index
    
  end


  def new
  
    @geo_info = GeoInfo.new(params[:geo_info])
    @geo_info.project_id = @project.id
    
    @geo_info.geo_type=1
    
    if request.post? and @geo_info.save
      flash[:notice] = "Success to create geo_info"
      redirect_to :action => "index", :project_id => @project
    end
  end


  def list
  end

private
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end 

end
