class SchoolResponse < ActiveRecord::Base
  belongs_to :request
  attr_accessible :note, :users

  has_and_belongs_to_many :users
end
