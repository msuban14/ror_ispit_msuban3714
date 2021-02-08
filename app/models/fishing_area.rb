class FishingArea < ApplicationRecord
  belongs_to :user
  #active storage
  has_one_attached :thumbnail, dependent: :detach
  after_commit :add_default_thumbnail, on:[:create, :update]

  validates :name, length: {minimum:3}

  self.per_page=12

  def optimized_image(image,x,y)
    image.variant(resize_to_fill: [x, y]).processed
  end

  private

  def add_default_thumbnail
    unless thumbnail.attached?
      self.thumbnail.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpg")), filename: 'default.jpg' , content_type: "image/jpg")
    end
  end

end
