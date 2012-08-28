class Customer < ActiveRecord::Base
  unloadable
  
  def full_name
    return "#{family_name} #{first_name}"
  end
  
end
