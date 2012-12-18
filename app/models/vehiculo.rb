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
#  idUsuario    :integer
#

class Vehiculo < ActiveRecord::Base
  attr_accessible :color, :maxPasajeros, :nombre, :puertas, :auxilio, :modelo, :seguro

  has_many :viajes, :class_name => "Viaje"

  belongs_to :auxilio, :class_name => "Auxilio", :foreign_key => "idAuxilio"
  belongs_to :modelo, :class_name => "Modelo", :foreign_key => "idModelo"
  belongs_to :seguro, :class_name => "Seguro", :foreign_key => "idSeguro"
  belongs_to :usuario, :class_name => "User", :foreign_key => "idUsuario"

  def as_json(options={})
    #if (options.empty?)
    options = { :include => [
                  :auxilio,
                  :modelo,
                  :seguro
              ]}
    #end
    super(options)
  end
end
