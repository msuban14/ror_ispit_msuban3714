class FishingArea < ApplicationRecord
  belongs_to :user
  belongs_to :body_of_water
  belongs_to :country
  belongs_to :location
  belongs_to :fishery
  has_many :comments, dependent: :destroy
  #active storage
  has_one_attached :thumbnail, dependent: :detach
  #if user did not attach image
  after_commit :add_default_thumbnail, on:[:create, :update]

  validates :name, length: {minimum:3},presence: true, uniqueness: true

  self.per_page=9

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
