class AddEmployeeRefToPromoter < ActiveRecord::Migration
  def change
    add_reference :promoters, :employee, index: true
  end
end
