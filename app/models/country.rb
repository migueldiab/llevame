class Country < ActiveRecord::Base

  validates :name, :length => { :maximum => 50 }
  has_many :cities
end
