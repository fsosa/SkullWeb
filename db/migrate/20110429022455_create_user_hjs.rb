class CreateUserHjs < ActiveRecord::Migration
  def self.up
    create_table :user_hjs do |t|
      t.integer :assigned_user_id
      t.integer :hj_id
      t.date :due
      t.boolean :isComplete

      t.timestamps
    end
  end

  def self.down
    drop_table :user_hjs
  end
end
