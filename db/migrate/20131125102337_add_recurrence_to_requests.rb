class AddRecurrenceToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :recurrence, :string
  end
end
