class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :fishing_area
  validates :body, presence:true, length:{maximum: 255}

  
end
