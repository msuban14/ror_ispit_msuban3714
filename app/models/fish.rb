class Fish < ApplicationRecord
  has_and_belongs_to_many :fishing_areas
  validates :name, length: {minimum:3,maximum:100},presence: true, uniqueness: true
  validates :latin_name, length: {minimum:3,maximum:100},presence: true, uniqueness: true
  validates :description, length: {maximum:1024}
end
