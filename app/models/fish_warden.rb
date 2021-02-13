class FishWarden < ApplicationRecord
  validates :phone, length: {minimum:9, maximum:15},presence: true, uniqueness: true
  validates :name, length: {minimum:1},presence: true
  belongs_to :licence_issuer
end
