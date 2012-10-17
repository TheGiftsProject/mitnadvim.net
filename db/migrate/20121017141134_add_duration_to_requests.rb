class AddDurationToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :duration, :integer
  end
end
