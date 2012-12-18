# == Schema Information
#
# Table name: auxilios
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  logo       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Auxilio < ActiveRecord::Base
  attr_accessible :logo, :nombre

  has_many :vehiculos, :class_name => "Vehiculo"
end
