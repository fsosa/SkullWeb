class RemoveDateTimeFromReservations < ActiveRecord::Migration
  def self.up
	remove_column :reservations, :start
	remove_column :reservations, :end
  end

  def self.down
  	add_column :reservations, :start, :datetime
	add_column :reservations, :end, :datetime
  end
end
