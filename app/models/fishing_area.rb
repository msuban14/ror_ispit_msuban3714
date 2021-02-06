class FishingArea < ApplicationRecord
  belongs_to :user
  #active storage
  has_one_attached :thumbnail

  validates :name, length: {minimum:3}

  self.per_page=12

  def optimized_image(image,x,y)
    image.variant(resize_to_fill: [x, y]).processed
  end

end
