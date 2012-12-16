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
  attr_accessible :idPais, :nombre
end
