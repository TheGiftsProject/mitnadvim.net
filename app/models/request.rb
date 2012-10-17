class Request < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :photo_url, :school_id, :status
  attr_accessible :category, :school, :type, :recurrence, :recurrence_id, :duration

  belongs_to :category
  belongs_to :recurrence
  belongs_to :school
  has_many :responses

  validates_presence_of :name, :description, :category, :recurrence, :duration

  scope :closed, where(:closed => true)
end
