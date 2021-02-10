class BodyOfWater < ApplicationRecord
enum water_type: [ :river, :lake, :stream, :canal, :sea ]
validates :water_type, presence:true
validates :name, presence:true, length:{maximum: 100}
has_many :fishing_areas

def to_label
  "#{name} | type: #{water_type}"
end
end
