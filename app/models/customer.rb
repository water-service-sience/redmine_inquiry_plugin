class Customer < ActiveRecord::Base
  unloadable
  
  def full_name
    return "#{family_name} #{first_name}"
  end
  
  has_many :own_lands
  has_many :geo_infos, :through => :own_lands
  
end

class OwnLand < ActiveRecord::Base

  unloadable
  
  belongs_to :customer
  belongs_to :geo_info
  
end
