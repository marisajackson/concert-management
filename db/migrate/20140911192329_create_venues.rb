class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :contact_name
      t.string :contact_number

      t.references :promoter

      t.timestamps
    end
  end
end
