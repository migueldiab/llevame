# == Schema Information
#
# Table name: vehiculos
#
#  id           :integer          not null, primary key
#  nombre       :string(255)
#  puertas      :integer
#  color        :string(255)
#  idModelo     :integer
#  maxPasajeros :integer
#  idSeguro     :integer
#  idAuxilio    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vehiculo < ActiveRecord::Base
  attr_accessible :color, :idAuxilio, :idAuxilio, :idAuxilio, :idModelo, :idSeguro, :maxPasajeros, :nombre, :puertas
end
