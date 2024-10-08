class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants
  has_many :bookings
  has_many :reviews, through: :booking
  has_one_attached :photo

  validates :first_name, :last_name, presence: true
end
