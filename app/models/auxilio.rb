class Auxilio < ActiveRecord::Base
  attr_accessible :logo, :nombre

  has_many :vehiculos, :class_name => "Vehiculo"
end
