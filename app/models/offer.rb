class Offer < ApplicationRecord
  monetize :price_cents, allow_nil: false, numericality: { greater_than: 0 }

  has_one_attached :image

  validates :title, :price, presence: true
end
