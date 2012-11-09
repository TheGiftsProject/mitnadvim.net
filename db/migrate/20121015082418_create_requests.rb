class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :status
      t.integer :school_id
      t.string :name
      t.text :description
      t.string :photo_url
      t.integer :category_id

      t.timestamps
    end
  end
end
