class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :request_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
