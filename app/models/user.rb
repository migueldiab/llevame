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

require 'digest'

class User < ActiveRecord::Base
  attr_accessible :dob, :email, :login, :password, :rep, :salt

  validates :password, :presence =>true,
            :length => { :maximum => 50 }
  validates :login, :presence =>true,
            :length => { :maximum => 50 }
  validates :email, :presence =>true,
            :length => { :maximum => 255 }

  before_save :encrypt_password



  def self.authenticate_with_salt(id, salt)
    user = find_by_id(id)
    (user && user.salt == salt) ? user : nil
  end

  def has_password?(submitted_password)
    #logger.info submitted_password
    #logger.info password
    #logger.info encrypt(submitted_password)
    password == encrypt(submitted_password)
  end

  private
  ###########################################
  def encrypt_password
    if new_record?
      self.salt = make_salt
      self.password = encrypt(password)
    end
  end

  def make_salt
    secure_hash("#{Time.now.utc}-hash-#{password}")
  end


  def encrypt(plain_password)
    secure_hash("#{salt}-hash-#{plain_password}")
  end

  def secure_hash(salt)
    Digest::SHA2.hexdigest(salt)
  end
  ###########################################
end
