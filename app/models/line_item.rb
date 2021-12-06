class LineItem < ApplicationRecord

  belongs_to :order
  belongs_to :product

  validates :quantity, :unit_price_in_cents, presence: true
  validates :unit_price_in_cents, numericality: {
    only_integer: true,
    greater_than: 0
  }, allow_nil: true

  before_validation :set_price
  after_save :update_total_amount

  private def set_price
    return unless product

    self.unit_price_in_cents = product.price_in_cents
  end

  def update_total_amount
    order.update_total
  end

  def unit_price
    unit_price_in_cents / 100.0
  end

end
