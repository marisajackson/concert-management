class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :name
      t.integer :expected_revenue
      t.integer :actual_cost
      t.boolean :viewable_by_employee
      t.references :concert, index: true
      t.references :income_category, index: true

      t.timestamps
    end
  end
end
