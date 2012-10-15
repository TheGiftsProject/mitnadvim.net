class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :type
      t.string :facebook_id
      t.integer :school_id
      t.string :gender
      t.integer :age
      t.integer :area_id

      t.timestamps
    end
  end
end
