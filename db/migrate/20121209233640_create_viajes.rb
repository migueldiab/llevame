class CreateViajes < ActiveRecord::Migration
  def change
    create_table :viajes do |t|
      t.integer :idUsuario
      t.integer :idCiudadOrigen
      t.integer :idCiudadDestino
      t.integer :idEstado
      t.boolean :equipaje
      t.boolean :animales
      t.integer :kms
      t.integer :pasaje
      t.integer :peajes
      t.datetime :fSalida
      t.datetime :fLlegada
      t.integer :paradas

      t.timestamps
    end
  end
end
