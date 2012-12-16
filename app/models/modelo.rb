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
  attr_accessible :idFabricante, :nombre
end
