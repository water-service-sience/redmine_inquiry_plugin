class CustomerController < ApplicationController
  unloadable
  before_filter :find_project


  def index
  end


  def new
    @customer = Customer.new(params[:customer])
    @customer.project_id = @project.id
    
    if request.post? and @customer.save
      flash[:notice] = "Success to create customer"
      redirect_to :action => "index", :project_id => @project
    end
  end

  def search
    
    @customers = Customer.find_by_project_id(:all,@project.id)
    respond_with(@customers)
  end
  
  def list
  end
  
  def edit
  
  end

private
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end 

end
