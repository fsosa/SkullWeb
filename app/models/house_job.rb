# == Schema Information
# Schema version: 20110429022730
#
# Table name: house_jobs
#
#  id          :integer         not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class HouseJob < ActiveRecord::Base

validates :description, :presence => true

end
