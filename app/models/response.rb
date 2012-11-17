class Response < ActiveRecord::Base

  attr_accessible :request_id, :status, :note, :user_id
  attr_accessible :request, :user

  scope :active, where(:status => nil)

  belongs_to :request
  belongs_to :user
end
