class AddDatesCommentsToReservations < ActiveRecord::Migration
  def self.up
	add_column :reservations, :start_date, :date
	add_column :reservations, :end_date, :date
	add_column :reservations, :start_time, :time
	add_column :reservations, :end_time, :time
	add_column :reservations, :desc, :string
  end

  def self.down
	remove_column :reservations, :start_date
	remove_column :reservations, :end_date
	remove_column :reservations, :start_time
	remove_column :reservations, :end_time
	remove_column :reservations, :desc
  end
end
