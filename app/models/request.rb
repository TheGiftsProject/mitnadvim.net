class Request < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :photo_url, :school_id, :status
  attr_accessible :category, :school, :type, :recurrence, :recurrence_id, :duration

  belongs_to :category
  belongs_to :recurrence
  belongs_to :school
  has_many :responses, :dependent => :destroy

  has_many :responded_users, :class_name => "User", :source => :user, :through => :responses

  validates_presence_of :name, :description, :category, :recurrence, :duration

  scope :closed, where(:closed => true)
  scope :active, where(:closed => false)

  def close!(user_ids, note)
    # close the request
    self.closed = true
    save!

    # update the responses
    volunteers_responses = responses.belong_to_users user_ids
    volunteers_responses.each {|response| response.complete!(note)}
  end

end
