class User < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :age, :area_id, :email, :facebook_id, :first_name, :gender, :last_name, :phone_number, :school_id, :type
  attr_accessible :area, :school

  belongs_to :area
  belongs_to :school

  validates_presence_of   :email
  validates_uniqueness_of :email
  validates_format_of     :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

end
