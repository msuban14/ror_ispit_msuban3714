class Country < ApplicationRecord
  validates :name, length: {minimum:3},presence: true, uniqueness: true
  has_many :fishin_areas
  has_many :locations, dependent: :destroy
  has_many :fisheries, dependent: :destroy


  def to_label
    "#{name}"
  end
end
