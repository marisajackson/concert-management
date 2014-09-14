class AddConcertRefToPromoter < ActiveRecord::Migration
  def change
    add_reference :promoters, :concert, index: true
  end
end
