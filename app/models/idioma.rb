# == Schema Information
#
# Table name: idiomas
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Idioma < ActiveRecord::Base
  attr_accessible :nombre
end
