class LicenceIssuer < ApplicationRecord
  validates :name, length: {minimum:3},presence: true, uniqueness: true
  has_many :fisheries
  #TODO wardens
end
