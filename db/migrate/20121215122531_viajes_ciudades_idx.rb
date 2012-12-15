class ViajesCiudadesIdx < ActiveRecord::Migration
  def up
    add_index :viajes, :idCiudadOrigen
    add_index :viajes, :idCiudadDestino
  end

  def down
  end
end
