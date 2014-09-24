class AddNotesToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :notes, :string
  end
end
