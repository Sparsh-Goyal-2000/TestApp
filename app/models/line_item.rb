class LineItem < ApplicationRecord

  belongs_to :reservation
  belongs_to :branch_product
  has_one :product, through: :branch_product

  validates :quantity, presence: true

  before_create :set_price

  private def set_price
    self.buying_price_in_cents = branch_product.price_in_cents
  end

  def buying_price
    buying_price_in_cents / 100
  end

end
