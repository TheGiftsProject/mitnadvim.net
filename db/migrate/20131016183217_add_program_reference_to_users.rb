class AddProgramReferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :program_id, :integer
    add_index :users, :program_id
  end
end
