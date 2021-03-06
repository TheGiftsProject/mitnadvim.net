class User < ActiveRecord::Base

  attr_accessor :password

  attr_accessible :area_id, :email, :facebook_id, :first_name, :gender, :last_name, :phone_number, :birth_year, :description
  attr_accessible :school, :school_id, :program_id, :password, :password_confirmation, :role

  belongs_to :area
  belongs_to :school, :dependent => :destroy # this is only relevant to school admin users.
  belongs_to :program # this is only relevant to volunteers

  has_many :responses, :dependent => :destroy
  has_many :requests, :through => :responses
  #validates :password, confirmation: true, length: { minimum: 2 }, on: :create
  #validates_presence_of :password_confirmation

  before_save :encrypt_password

  validates_presence_of   :email
  validates_uniqueness_of :email
  validates_format_of     :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates :first_name, length: { minimum: 2 }
  validates :phone_number, length: { minimum: 2 }
  validates :password, :presence => true,
            :confirmation => true,
            :length => {:within => 6..40}

  enum :role, [:volunteer, :school]

  def fullname
    "#{first_name} #{last_name}"
  end

  def age
    Date.today.year - birth_year
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

end
