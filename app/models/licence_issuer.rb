class LicenceIssuer < ApplicationRecord
  validates :name, length: {minimum:3},presence: true, uniqueness: true
  has_many :fisheries
  has_many :fish_wardens

  
end
