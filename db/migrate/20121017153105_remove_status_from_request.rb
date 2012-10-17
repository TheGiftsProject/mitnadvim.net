class RemoveStatusFromRequest < ActiveRecord::Migration
  def up
    remove_column :requests, :status
  end

  def down
    add_column :requests, :status, :string
  end
end
