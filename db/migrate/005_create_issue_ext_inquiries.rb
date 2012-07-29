class CreateIssueExtInquiries < ActiveRecord::Migration
  def change
    create_table :issue_ext_inquiries do |t|

      t.integer :issue_id

      t.integer :customer_id

      t.integer :geo_info_id
      
      t.string :customer_name
      
      t.decimal :longitude
      
      t.decimal :latitude


    end

  end
end
