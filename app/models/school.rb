class School < ActiveRecord::Base
  attr_accessible :area_id, :description, :name, :photo_url, :address
  attr_accessible :area

  belongs_to :area
  has_one :admin, :class_name => 'User', :dependent => :destroy
  has_many :requests, :dependent => :destroy

  validates :name, length: { minimum: 2 }

  validates_associated :area

  def full_address
    "#{address}, #{area.name}"
  end

end
