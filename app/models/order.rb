class Order < ApplicationRecord

  belongs_to :restaurant
  belongs_to :customer
  has_many :line_items, dependent: :destroy

  def total_amount
    total_amount_in_cents / 100.0
  end

  def update_total
    update_column(:total_amount_in_cents, line_items.sum("unit_price_in_cents * quantity"))
  end

end
