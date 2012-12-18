class VehiculoEnViaje < ActiveRecord::Migration
  def change
    add_column :viajes, :idVehiculo, :integer
  end
end
