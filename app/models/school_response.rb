class SchoolResponse < ActiveRecord::Base
  belongs_to :request
  attr_accessible :note
end
