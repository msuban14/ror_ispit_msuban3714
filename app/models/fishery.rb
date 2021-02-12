class Fishery < ApplicationRecord
  belongs_to :country
  has_many :fishing_areas
  validates :name, length: {minimum:3},presence: true, uniqueness: true

  def to_label
    "#{name}"
  end
end
