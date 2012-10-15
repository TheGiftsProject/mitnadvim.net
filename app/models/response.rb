class Response < ActiveRecord::Base
  attr_accessible :request_id, :status, :user_id
  attr_accessible :request, :user

  belongs_to :request
  belongs_to :user
end
