class User < ActiveRecord::Base
  attr_accessible :age, :area_id, :email, :facebook_id, :first_name, :gender, :last_name, :phone_number, :school_id, :type
  attr_accessible :area, :school

  belongs_to :area
  belongs_to :school

  has_many :responses
  has_many :requests, :through => :responses

end
