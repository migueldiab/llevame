# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  login      :string(255)
#  email      :string(255)
#  password   :string(255)
#  salt       :string(255)
#  dob        :date
#  rep        :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :login, :email


  validates :login, :prescence => true
                    ,length => { :minimum => 3 }
                    ,length => { :maximum => 50 }



end
