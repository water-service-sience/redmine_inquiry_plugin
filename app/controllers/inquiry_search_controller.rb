class InquirySearchController < ApplicationController
  unloadable
  before_filter :find_project
  
  respond_to :json

  def find_customers
    
    #@customers = Customer.find_by_project_id(@project.id,:all)
    q = params[:q]
    likeStr = q + "%"
    #@customers = Customer.where(["project_id = ?", @project.id]).where(["phone_number like ?",likeStr]).all
    
    s = 
<<EOS
select * from customers where project_id = :pId and (
  family_name like :q or
  first_name like :q or
  phone_number like :q or
  address like :q );
EOS
    @customers = Customer.find_by_sql([s, { :pId => @project.id, :q => likeStr}])
    # map to json structure
    list = []
    
    for c in @customers
      list << {"id" => c.id, 
        "name" => c.family_name + " " + c.first_name,
        "family_name" => c.family_name, 
        "first_name" => c.first_name,
        "address" => c.address,
        "phone_number" => c.phone_number}
    end
    
    respond_with(list)
  end
  

private
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end 

end
