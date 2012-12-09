class CreateCiudads < ActiveRecord::Migration
  def change
    create_table :ciudads do |t|
      t.string :nombre
      t.integer :coordX
      t.integer :coordY
      t.integer :popular
      t.integer :poblacion
      t.integer :usuarios
      t.integer :idDepartamento

      t.timestamps
    end
  end
end
