class LineItem < ApplicationRecord

  belongs_to :reservation
  belongs_to :branch_product
  has_one :product, through: :branch_product

  validates :quantity, :buying_price_in_cents, presence: true

  before_validation :set_price, on: :create
  after_save :update_total_amount

  def buying_price
    buying_price_in_cents / 100.0
  end

  private def set_price
    self.buying_price_in_cents = branch_product.price_in_cents
  end

  private def update_total_amount
    reservation.update_total
  end

end
