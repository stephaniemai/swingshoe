class Shoesize < ApplicationRecord
  belongs_to :shoe
  validates :size, prensece: true
  validates :stock, presence: true
end
