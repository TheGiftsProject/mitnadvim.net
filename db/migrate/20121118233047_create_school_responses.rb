class CreateSchoolResponses < ActiveRecord::Migration

  def change
    create_table :school_responses do |t|
      t.references :request
      t.string :note

      t.timestamps
    end

    add_index :school_responses, :request_id
  end

end
