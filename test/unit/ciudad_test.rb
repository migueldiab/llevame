# == Schema Information
#
# Table name: ciudads
#
#  id             :integer          not null, primary key
#  nombre         :string(255)
#  coordX         :integer
#  coordY         :integer
#  popular        :integer
#  poblacion      :integer
#  usuarios       :integer
#  idDepartamento :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class CiudadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
