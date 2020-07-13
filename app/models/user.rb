class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goals, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :goal_comments, dependent: :destroy

  validates :name, presence: true
  validates :introduction, length: { maximum: 100 }
  validates :email, presence: true

  attachment :profile_image

end
