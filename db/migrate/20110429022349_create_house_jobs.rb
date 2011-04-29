class CreateHouseJobs < ActiveRecord::Migration
  def self.up
    create_table :house_jobs do |t|
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :house_jobs
  end
end
