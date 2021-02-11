class Location < ApplicationRecord
  validates :name, length: {minimum:3, maximum:100},presence: true
  validates :province, length: {minimum:3, maximum:100},presence: true
  has_many :fishing_areas
  belongs_to :country

  def to_label
    "#{name}, #{province}"
  end
end
