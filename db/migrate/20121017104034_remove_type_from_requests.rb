class RemoveTypeFromRequests < ActiveRecord::Migration
  def up
    remove_column :requests, :type
  end

  def down
    add_column :requests, :type, :string
  end
end
