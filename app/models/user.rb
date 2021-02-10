class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :fishing_areas
  has_many :comments, dependent: :destroy

  def username
    email.split("@")[0].capitalize
  end

  def to_label
    username
  end
end
