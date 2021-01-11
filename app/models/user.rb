class User < ApplicationRecord
  has_one_attached :photo
  has_many :products
  has_many :rentals
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
