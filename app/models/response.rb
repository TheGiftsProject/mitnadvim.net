class Response < ActiveRecord::Base

  attr_accessible :request_id, :status, :note, :user_id
  attr_accessible :request, :user

  scope :active, joins(:request).where("responses.status = 'created' AND requests.closed = false")
  scope :completed, where(:status => "completed")
  scope :belong_to_users, lambda {|uid| where(:user_id => uid)}

  belongs_to :request
  belongs_to :user

  def complete!(note)
    self.status = :completed
    self.note_from_school = note
    save!
  end

end
