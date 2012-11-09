class AddNoteToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :note, :text
  end
end
