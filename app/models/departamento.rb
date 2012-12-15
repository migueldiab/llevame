# == Schema Information
#
# Table name: departamentos
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  habitantes :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Departamento < ActiveRecord::Base
  attr_accessible :habitantes, :nombre
end
