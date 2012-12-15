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

require 'test_helper'

class DepartamentoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
