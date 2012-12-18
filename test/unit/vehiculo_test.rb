# == Schema Information
#
# Table name: vehiculos
#
#  id           :integer          not null, primary key
#  nombre       :string(255)
#  puertas      :integer
#  color        :string(255)
#  idModelo     :integer
#  maxPasajeros :integer
#  idSeguro     :integer
#  idAuxilio    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  idUsuario    :integer
#

require 'test_helper'

class VehiculoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
