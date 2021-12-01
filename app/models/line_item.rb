class LineItem < ApplicationRecord

  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true

  before_create :set_price

  private def set_price
    self.buying_price_in_cents = product.price_in_cents
  end

  def buying_price
    buying_price_in_cents / 100
  end

end
