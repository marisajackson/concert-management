class AddVenueRefToPromoter < ActiveRecord::Migration
  def change
    add_reference :promoters, :venue, index: true
  end
end
