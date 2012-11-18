class User < ActiveRecord::Base
  attr_accessible :dob, :email, :login, :password, :rep, :salt
end
