class AddRecurrenceTable < ActiveRecord::Migration
  def up
    create_table :recurrences do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :recurrences
  end
end
