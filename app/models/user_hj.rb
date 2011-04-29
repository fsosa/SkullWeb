# == Schema Information
# Schema version: 20110429022730
#
# Table name: user_hjs
#
#  id               :integer         not null, primary key
#  assigned_user_id :integer
#  hj_id            :integer
#  due              :date
#  isComplete       :boolean
#  created_at       :datetime
#  updated_at       :datetime
#

class UserHj < ActiveRecord::Base

validates :assigned_user_id, :presence => true
validates :hj_id, :presence => true, :uniqueness => {:scope => [:assigned_user_id, :due]}


def username_desc
  name = User.find(assigned_user_id).fullname
  desc = HouseJob.find(hj_id).desc
  return [name, desc]
end

end
