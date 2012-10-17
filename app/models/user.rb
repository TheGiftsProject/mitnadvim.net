class User < ActiveRecord::Base
  attr_accessible :age, :area_id, :email, :facebook_id, :first_name, :gender, :last_name, :phone_number, :birth_year, :description
  attr_accessible :area, :school, :school_id, :type

  belongs_to :area
  belongs_to :school

end
