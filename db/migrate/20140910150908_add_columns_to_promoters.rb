class AddColumnsToPromoters < ActiveRecord::Migration
  def change
    add_column :promoters, :provider, :string
    add_column :promoters, :uid, :string
  end
end
