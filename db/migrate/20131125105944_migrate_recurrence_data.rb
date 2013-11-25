class MigrateRecurrenceData < ActiveRecord::Migration
  def up
    execute <<-SQL
update requests
set recurrence = 'one_time'
where recurrence_id = 1
    SQL

    execute <<-SQL
update requests
set recurrence = 'weekly'
where recurrence_id = 2
    SQL

    execute <<-SQL
update requests
set recurrence = 'monthly'
where recurrence_id = 3
    SQL
  end

  def down
    execute <<-SQL
update requests
set recurrence_id = 1
where recurrence = 'one_time'
    SQL

    execute <<-SQL
update requests
set recurrence_id = 2
where recurrence = 'weekly'
    SQL

    execute <<-SQL
update requests
set recurrence_id = 3
where recurrence = 'monthly'
    SQL
  end
end
