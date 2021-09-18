class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  delegate :vendor, to: :product

  enum status: [:pending, :paid, :cancelled]

  after_create :generate_ref_no
  after_create :calculate_total

  def generate_ref_no
    #y7w40p
    random_string = SecureRandom.hex(3)
    self.ref_no = random_string
    self.save
  end

  def calculate_total
    self.total = product.price_per_quantity * quantity
    self.save
  end
end
