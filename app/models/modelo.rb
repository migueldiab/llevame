# == Schema Information
#
# Table name: modelos
#
#  id           :integer          not null, primary key
#  nombre       :string(255)
#  idFabricante :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Modelo < ActiveRecord::Base
  attr_accessible :fabricante, :nombre

  belongs_to :fabricante, :class_name => "Fabricante", :foreign_key => 'idFabricante'

  has_many :vehiculos, :class_name => "Vehiculo"
end
