class User < ActiveRecord::Base
  attr_accessible :age, :area_id, :email, :facebook_id, :first_name, :gender, :last_name, :phone_number, :school_id , :type, :password, :password_confirmation
  attr_accessible :area, :school

  belongs_to :area
  belongs_to :school

  #validates :password, confirmation: true, length: { minimum: 2 }, on: :create
  #validates_presence_of :password_confirmation

  validates_length_of :first_name, minimum: 2
  validates_length_of :phone_number, minimum: 2
  validates_length_of :email, minimum: 2

end
