class CreateOwnLands < ActiveRecord::Migration
  def change
    create_table :own_lands do |t|

      t.integer :customer_id

      t.integer :geo_info_id
      
    end

  end
end
