class RenameClosedInRequests < ActiveRecord::Migration

  def up
    rename_column :requests, :closed, :status
    change_column :requests, :status, :string, :default => :opened

    execute <<-END
      UPDATE requests
      SET status = 'opened'
      WHERE status = 'false'
    END

    execute <<-END
      UPDATE requests
      SET status = 'closed'
      WHERE status = 'true'
    END
  end

  def down
  end
end
