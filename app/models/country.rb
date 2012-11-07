# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  flag       :string(255)
#  language   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Country < ActiveRecord::Base

  validates :name, :length => { :maximum => 50 }
  has_many :cities
end
