# == Schema Information
#
# Table name: agendas
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  publica    :boolean
#  idUsuario  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Agenda < ActiveRecord::Base
  attr_accessible :idUsuario, :nombre, :publica
end
