class RenameTypeToRoleOnUsers < ActiveRecord::Migration

  def up
    remove_column :users, :type
    add_column :users, :role, :string, :default => 'volunteer'
  end

  def down
    add_column :users, :type
    remove_column :users, :role
  end
end
