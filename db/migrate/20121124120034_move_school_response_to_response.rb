class MoveSchoolResponseToResponse < ActiveRecord::Migration

  def up
    add_column :responses, :note_from_school, :text

    # TODO: fix this to MySQL syntax
    #execute <<-END
    #  UPDATE responses
    #  SET note_from_school = school_responses.note, status = 'completed'
    #  FROM school_responses, school_responses_users
    #  WHERE school_responses.request_id = responses.request_id AND
    #        school_responses_users.school_response_id = school_responses.id AND
    #        school_responses_users.user_id = responses.user_id;
    #END

    drop_table :school_responses_users
    drop_table :school_responses
  end

  def down
  end

end
