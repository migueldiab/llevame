# == Schema Information
#
# Table name: ciudads
#
#  id             :integer          not null, primary key
#  nombre         :string(255)
#  coordX         :integer
#  coordY         :integer
#  popular        :integer
#  poblacion      :integer
#  usuarios       :integer
#  idDepartamento :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Ciudad < ActiveRecord::Base
  attr_accessible :coordX, :coordY, :idDepartamento, :nombre, :poblacion, :popular, :usuarios

  has_many :viajesOrigen, :class_name => "Viaje", :foreign_key => "idCiudadOrigen"
  has_many :viajesDestino, :class_name => "Viaje", :foreign_key => "idCiudadDestino"



  def to_s
    "#{self.nombre}"
  end

end
