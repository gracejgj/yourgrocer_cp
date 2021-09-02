class Product < ApplicationRecord
  belongs_to :vendor
  has_many_attached :photos

  has_many :orders

  scope :is_available, -> { where(available: true) }
end
