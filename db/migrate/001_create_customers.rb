class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
    
      t.integer :project_id

      t.string :family_name

      t.string :first_name

      t.string :address

      t.string :note

      t.string :phone_number


    end

  end
end
