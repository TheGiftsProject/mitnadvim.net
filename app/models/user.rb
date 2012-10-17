class User < ActiveRecord::Base

  attr_accessor :password

  attr_accessible :area_id, :email, :facebook_id, :first_name, :gender, :last_name, :phone_number, :birth_year, :description
  attr_accessible :school, :school_id, :password, :password_confirmation, :role

  belongs_to :area
  belongs_to :school

  enum :role, [:admin, :school, :volunteer]

  before_save :encrypt_password

  validates_presence_of   :email
  validates_uniqueness_of :email
  validates_format_of     :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates :first_name, length: { minimum: 2 }
  validates :phone_number, length: { minimum: 2 }
  validates :password, :presence => true,
            :confirmation => true,
            :length => {:within => 6..40}

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
