class Shoe < ApplicationRecord
  validates :brand, length: { minimum: 3 }, presence: true
  validates :model, length: { minimum: 3 }, presence: true
  validates :price, presence: true
  has_many :shoesizes
end
