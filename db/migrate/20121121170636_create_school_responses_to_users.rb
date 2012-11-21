class CreateSchoolResponsesToUsers < ActiveRecord::Migration

  def change
    create_table :school_responses_users do |t|
      t.references :school_response
      t.references :user
    end
  end

end
