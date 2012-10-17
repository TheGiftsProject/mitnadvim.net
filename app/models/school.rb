class School < ActiveRecord::Base
  attr_accessible :area_id, :description, :name, :photo_url, :address
  attr_accessible :area


  belongs_to :area
  has_one :admin, :class_name => "User"
  has_many :requests

end
