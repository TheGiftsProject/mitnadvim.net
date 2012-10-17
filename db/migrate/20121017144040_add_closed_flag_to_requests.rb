class AddClosedFlagToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :closed, :boolean, :default => false
  end
end
