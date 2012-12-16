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
  attr_accessible :color, :maxPasajeros, :nombre, :puertas, :auxilio, :modelo, :seguro

  belongs_to :auxilio, :class_name => "Auxilio", :foreign_key => "idAuxilio"
  belongs_to :modelo, :class_name => "Modelo", :foreign_key => "idModelo"
  belongs_to :seguro, :class_name => "Seguro", :foreign_key => "idSeguro"
end
