class AddFirstNameToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :first_name, :string
  end
end
