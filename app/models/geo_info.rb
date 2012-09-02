class GeoInfo < ActiveRecord::Base
  unloadable
  
  def geo_type_label
    if geo_type == 1
      return "PointData"
    elsif geo_type == 2 
      return "LineData"
    else
      return "PointData"
    end
  end
  
  has_many :geo_points
end
