class Shoesize < ApplicationRecord
  belongs_to :shoe
  validates :size, presence: true
  validates :stock, presence: true
end
