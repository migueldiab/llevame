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

require 'test_helper'

class AgendaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
