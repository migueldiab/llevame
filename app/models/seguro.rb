# == Schema Information
#
# Table name: seguros
#
#  id         :integer          not null, primary key
#  nombre     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Seguro < ActiveRecord::Base
  attr_accessible :nombre
end
