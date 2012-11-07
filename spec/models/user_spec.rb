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

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
