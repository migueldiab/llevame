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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  verified   :boolean
#

class User < ActiveRecord::Base
  attr_accessible :dob, :email, :login, :password, :rep, :salt
end
