# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
namespace :seed_data do
  desc 'Load seed data into the database of the current environment'
  task :load => :environment do
	require 'active_record/fixtures'
	Dir.glob(RAILS_ROOT + '/db/seed/data/*.yml').each do |file|
	  Fixtures.create_fixtures('db/seed_data', File.basename(file, '.*'))
	end
  end
end