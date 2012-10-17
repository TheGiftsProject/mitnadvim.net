class User < ActiveRecord::Base
  attr_accessible :age, :area_id, :email, :facebook_id, :first_name, :gender, :last_name, :phone_number, :school_id , :role, :password, :password_confirmation
  attr_accessible :area, :school

  belongs_to :area
  belongs_to :school

  has_many :responses
  has_many :requests, :through => :responses
  #validates :password, confirmation: true, length: { minimum: 2 }, on: :create
  #validates_presence_of :password_confirmation

  validates :first_name, length: { minimum: 2 }
  validates :phone_number, length: { minimum: 2 }
  validates :email, length: { minimum: 2 }

  validates_associated :school

end
