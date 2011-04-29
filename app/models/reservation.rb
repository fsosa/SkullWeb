# == Schema Information
# Schema version: 20110429022730
#
# Table name: reservations
#
#  id               :integer         not null, primary key
#  reserved_user_id :integer
#  name             :string(255)
#  location         :string(255)
#  start            :datetime
#  end              :datetime
#  created_at       :datetime
#  updated_at       :datetime
#

class Reservation < ActiveRecord::Base

validates :reserved_user_id, :presence => true
validates :name, :presence => true
validates :location, :presence => true
validates :start, :presence => true
validates :end, :presence => true

end
