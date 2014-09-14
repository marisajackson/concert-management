class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :headliner
      t.datetime :date
      
      t.references :promoter

      t.timestamps
    end
  end
end
