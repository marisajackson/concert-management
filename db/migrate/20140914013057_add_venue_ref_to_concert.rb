class AddVenueRefToConcert < ActiveRecord::Migration
  def change
    add_reference :concerts, :venue, index: true
  end
end
