class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable , :omniauthable

  has_many :lives

  enum role: { viewer: 0, livecaster: 1, boss: 2 }

  validates :bio, length: { maximum: 150 }
  
end
