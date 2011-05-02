# == Schema Information
# Schema version: 20110501152928
#
# Table name: reservations
#
#  id               :integer         not null, primary key
#  reserved_user_id :integer
#  name             :string(255)
#  location         :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  start_date       :date
#  end_date         :date
#  start_time       :time
#  end_time         :time
#  desc             :string(255)
#

class Reservation < ActiveRecord::Base

validates :reserved_user_id, :presence => true
validates :name, :presence => true
validates :location, :presence => true
validates :start_time, :presence => true
validates :end_time, :presence => true
validates :start_date, :presence => true
validates :end_date, :presence => true
validate :non_paradox


def non_paradox
	if start_time > end_time
		puts "PPPP..PPP...PARADOX!"
		errors.add(:start_time, "paradox")
	end
end


	


end
