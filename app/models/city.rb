# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  country_id :integer
#  population :integer
#  x_coord    :string(255)
#  y_coord    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class City < ActiveRecord::Base
  belongs_to :country
end
