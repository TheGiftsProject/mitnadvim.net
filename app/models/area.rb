class Area < ActiveRecord::Base
  attr_accessible :name

  has_many :schools

  def self.areas_with_schools
    areas = Area.all
    areas_hash = {}
    areas.each do |area|
      areas_hash[area.id.to_s] = [""].concat area.schools.map {|school| school.id.to_s}
    end
    areas_hash[""] = [""].concat areas.map {|area| area.schools.map {|school| school.id.to_s}}.flatten
    areas_hash
  end
end
