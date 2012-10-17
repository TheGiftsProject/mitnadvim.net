class ChangeRequestRecurrenceToReference < ActiveRecord::Migration
  def up
    remove_column :requests, :recurrence
    add_column :requests, :recurrence_id, :integer
  end

  def down
    remove_column :requests, :recurrence_id
    add_column :requests, :recurrence, :string
  end
end
