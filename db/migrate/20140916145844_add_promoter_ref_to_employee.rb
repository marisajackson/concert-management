class AddPromoterRefToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :promoter, index: true
  end
end
