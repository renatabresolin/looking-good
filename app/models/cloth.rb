class Cloth < ApplicationRecord
  belongs_to :user
  has_many :users, through: :rentals
end
