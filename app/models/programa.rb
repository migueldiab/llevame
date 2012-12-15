# == Schema Information
#
# Table name: programas
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  idAgenda   :integer
#  fInicio    :date
#  fFin       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Programa < ActiveRecord::Base
  attr_accessible :fFin, :fInicio, :idAgenda, :nombre
end
