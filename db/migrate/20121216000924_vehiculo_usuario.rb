class VehiculoUsuario < ActiveRecord::Migration
  def change
    add_column :vehiculos, :idUsuario, :integer
  end
end
