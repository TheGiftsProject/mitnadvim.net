class Request < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :photo_url, :school_id, :status
  attr_accessible :category, :school, :type, :recurrence, :recurrence_id, :duration

  belongs_to :category
  belongs_to :recurrence
  belongs_to :school
  has_many :responses

  has_many :responded_users, class_name: "User", source: :user, :through => :responses

  validates_presence_of :name, :description, :category, :recurrence, :duration

  scope :not_closed, where(:closed => false)
  scope :closed, where(:closed => true)
  scope :active, where(:closed => false)

end
