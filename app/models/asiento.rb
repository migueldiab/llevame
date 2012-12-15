# == Schema Information
#
# Table name: asientos
#
#  id         :integer          not null, primary key
#  idViaje    :integer
#  idUsuario  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Asiento < ActiveRecord::Base
  attr_accessible :idUsuario, :idViaje
end
