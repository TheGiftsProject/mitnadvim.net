class AddDetailsToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :type, :string
    add_column :requests, :recurrence, :string
  end
end
