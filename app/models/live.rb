class Live < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_one_attached :image

  belongs_to :user
end
