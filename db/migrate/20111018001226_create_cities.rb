class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :country_id
      t.integer :population
      t.string :x_coord
      t.string :y_coord

      t.timestamps
    end
  end
end
