class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :expected_cost
      t.integer :actual_cost
      t.boolean :viewable_by_employee
      t.references :concert, index: true
      t.references :expense_category, index: true

      t.timestamps
    end
  end
end
