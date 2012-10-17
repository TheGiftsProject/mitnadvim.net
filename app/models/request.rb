class Request < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :photo_url, :school_id, :status
  attr_accessible :category, :school, :type, :recurrence

  belongs_to :category
  belongs_to :school
  has_many :responses

end
