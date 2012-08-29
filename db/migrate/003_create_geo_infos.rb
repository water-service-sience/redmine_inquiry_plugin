class CreateGeoInfos < ActiveRecord::Migration
  def change
    create_table :geo_infos do |t|
    
      t.integer :project_id

      t.string :name

      t.integer :category

      t.integer :geo_type

      t.float :longitude

      t.float :latitude


    end

  end
end
