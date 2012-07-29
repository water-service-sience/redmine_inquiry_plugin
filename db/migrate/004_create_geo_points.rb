class CreateGeoPoints < ActiveRecord::Migration
  def change
    create_table :geo_points do |t|

      t.integer :geo_info_id

      t.decimal :longitude

      t.decimal :latitude


    end

  end
end
