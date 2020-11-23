class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :cloth
  validates :user_id, :cloth_id, presence: true
end
