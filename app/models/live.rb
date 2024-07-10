class Live < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_one_attached :image

  has_many :live_tags
  has_many :tags, through: :live_tags

  belongs_to :user
end
