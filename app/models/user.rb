class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable , :omniauthable

  has_many :lives

  has_one_attached :photo

  enum role: { viewer: 0, livecaster: 1, boss: 2 }

  validates :bio, length: { maximum: 150 }

  validates :username, presence: true, uniqueness: true

  def fullname
    "#{first_name} #{last_name}"
  end


end
