class ChangeResponsesAddDefaultStatus < ActiveRecord::Migration

  def up
    change_column :responses, :status, :string, :default => "created"

    execute <<-END
      UPDATE responses
      SET status = 'created'
      WHERE status IS NULL;
    END
  end

  def down
  end

end
