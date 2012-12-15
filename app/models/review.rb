# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  idUsuario  :integer
#  idViaje    :integer
#  idAsiento  :integer
#  asunto     :string(255)
#  desc       :text
#  puntaje    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base
  attr_accessible :asunto, :desc, :idAsiento, :idUsuario, :idViaje, :puntaje
end
