# == Schema Information
# Schema version: 20110429021036
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  prettyname :string(255)
#  password   :string(255)
#  isAdmin    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	attr_accessible :username, :password, :prettyname
	
	validates :username, :presence => true
	validates :prettyname, :presence => true
	validates :password, :presence => true
	
	
end
