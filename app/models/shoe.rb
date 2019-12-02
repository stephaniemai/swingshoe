class Shoe < ApplicationRecord
  validates :brand, length: { minimum: 3 }, presence: true
  validates :model, length: { minimum: 3 }, presence: true
  validates :price, presence: true
  has_many :shoesizes
  include PgSearch::Model
  pg_search_scope :search_by_brand_and_model,
                  against: %i[brand model],
                  # using: { tsearch: { prefix: true } }
                  using: { trigram: {} }
end
