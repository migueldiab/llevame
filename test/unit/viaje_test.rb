# == Schema Information
#
# Table name: viajes
#
#  id              :integer          not null, primary key
#  idUsuario       :integer
#  idCiudadOrigen  :integer
#  idCiudadDestino :integer
#  idEstado        :integer
#  equipaje        :boolean
#  animales        :boolean
#  kms             :integer
#  pasaje          :integer
#  peajes          :integer
#  fSalida         :datetime
#  fLlegada        :datetime
#  paradas         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  idVehiculo      :integer
#

require 'test_helper'

class ViajeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
