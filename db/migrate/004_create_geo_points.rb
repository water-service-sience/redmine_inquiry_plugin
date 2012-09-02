class CreateGeoPoints < ActiveRecord::Migration
  def change
    create_table :geo_points do |t|

      t.integer :geo_info_id

      t.float :longitude

      t.float :latitude


    end

  end
end
