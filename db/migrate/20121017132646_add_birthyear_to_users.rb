class AddBirthyearToUsers < ActiveRecord::Migration

  def change
    remove_column :users, :age
    add_column :users, :birth_year, :integer
  end

end
