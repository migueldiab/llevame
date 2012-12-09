class Viaje < ActiveRecord::Base
  attr_accessible :animales, :equipaje, :fLlegada, :fSalida, :idCiudadDestino, :idCiudadOrigen, :idEstado, :idUsuario, :kms, :paradas, :pasaje, :peajes
end
