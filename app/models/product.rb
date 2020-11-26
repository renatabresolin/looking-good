class Product < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo

include PgSearch::Model
  pg_search_scope :search_by_description,
    against: [ :description, :category ],
    using: {
      tsearch: { prefix: true }
    }
end
