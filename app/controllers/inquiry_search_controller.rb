class InquirySearchController < ApplicationController
  unloadable
  before_filter :find_project
  
  respond_to :json

  def find_customers
    
    q = params[:q]
    likeStr = q + "%"
    
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
        "name" => c.full_name,
        "family_name" => c.family_name, 
        "first_name" => c.first_name,
        "address" => c.address,
        "phone_number" => c.phone_number}
    end
    
    respond_with(list)
  end
  
  def public_places
s = 
<<EOS
select * from geo_infos where project_id = :pId and 
  category = 1;
EOS
    @places = GeoInfo.find_by_sql([s, { :pId => @project.id}])
    
    
    list = []
    
    for c in @places
      list << {"id" => c.id, 
        "name" => c.name,
        "lat" => c.latitude, 
        "lon" => c.longitude}
    end
    
    respond_with(list)
    
  end
  
  def own_lands
    customer_id = params[:customer_id]
    
    customer = Customer.find(customer_id)
    
    list = []
    for p in customer.geo_infos
      list << {
        "name" => p.name,
        "lat" => p.latitude,
        "lon" => p.longitude
      }
    end
    
    respond_with(list)
  end
  
  def geo_info
    g = GeoInfo.find( params[:geo_info_id])
  
    data = { 
      "name" => g.name,
      "geo_type" => g.geo_type,
      "center" => [g.latitude,g.longitude],
    }
    points = []
    for p in g.geo_points
      points << [p.latitude,p.longitude]
    end
    data["points"] = points
    
    respond_with(data)
  end
  
  

private
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end 

end
