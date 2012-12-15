class CreateVehiculos < ActiveRecord::Migration
  def change
    create_table :vehiculos do |t|
      t.string :nombre
      t.integer :puertas
      t.string :color
      t.integer :idModelo
      t.integer :maxPasajeros
      t.integer :idSeguro
      t.integer :idAuxilio

      t.timestamps
    end
  end
end
