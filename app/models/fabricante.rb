# == Schema Information
#
# Table name: fabricantes
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  idPais     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fabricante < ActiveRecord::Base
  attr_accessible :pais, :nombre

  has_many :modelos, :class_name => "Modelo"

  belongs_to :pais, :class_name => "Pais", :foreign_key => "idPais"

end
