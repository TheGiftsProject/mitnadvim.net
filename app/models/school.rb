class School < ActiveRecord::Base
  attr_accessible :area_id, :description, :name, :photo_url, :address
  attr_accessible :area

  belongs_to :area
  has_one :admin, :class_name => "User"
  has_many :requests

  validates :name, length: { minimum: 2 }

  validates_associated :area

  def self.from_area(area_id)
    return School.all unless area_id.present?
    School.where(area_id: area_id)
  end

end
