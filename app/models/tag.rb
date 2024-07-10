class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :live_tags
  has_many :lives, through: :live_tags
end
