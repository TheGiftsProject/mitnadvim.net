class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.text :description
      t.string :photo_url
      t.integer :area_id

      t.timestamps
    end
  end
end
