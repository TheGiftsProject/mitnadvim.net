class Request < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :photo_url, :school_id, :status
  attr_accessible :category, :school, :type, :recurrence, :duration

  belongs_to :category
  belongs_to :school
  has_many :responses, :dependent => :destroy

  has_many :responded_users, :class_name => "User", :source => :user, :through => :responses

  validates_presence_of :name, :description, :category, :recurrence, :duration

  enum :status, [:opened, :closed]
  enum :recurrence, [:one_time, :weekly, :monthly], allow_nil: true
  scope :newest_first, order('requests.created_at DESC')

  def close!(user_ids, note)
    closed!

    # update the responses
    volunteers_responses = responses.belong_to_users user_ids
    volunteers_responses.each {|response| response.complete!(note)}
  end

end
