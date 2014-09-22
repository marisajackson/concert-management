class AddEmployeeRefToConcert < ActiveRecord::Migration
  def change
    add_reference :concerts, :employee, index: true
  end
end
