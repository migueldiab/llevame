# == Schema Information
#
# Table name: viajes
#
#  id              :integer          not null, primary key
#  idUsuario       :integer
#  idCiudadOrigen  :integer
#  idCiudadDestino :integer
#  idEstado        :integer
#  equipaje        :boolean
#  animales        :boolean
#  kms             :integer
#  pasaje          :integer
#  peajes          :integer
#  fSalida         :datetime
#  fLlegada        :datetime
#  paradas         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  idVehiculo      :integer
#

class Viaje < ActiveRecord::Base
  attr_accessible :animales, :equipaje, :fLlegada, :fSalida, :idEstado, :kms, :paradas,
                  :pasaje, :peajes, :ciudadOrigen, :ciudadDestino,
                  :user, :vehiculo

  belongs_to :user, :class_name => "User", :foreign_key => "idUsuario"
  belongs_to :vehiculo, :class_name => "Vehiculo", :foreign_key => "idVehiculo"

  belongs_to :ciudadOrigen, :class_name => "Ciudad", :foreign_key => "idCiudadOrigen"
  belongs_to :ciudadDestino, :class_name => "Ciudad", :foreign_key => "idCiudadDestino"



  def as_json(options={})
    #if (options.empty?)
      options = { :include => [ :ciudadDestino, :ciudadOrigen, :user.as_json, :vehiculo ] }
    #end
    super(options)
  end
end
