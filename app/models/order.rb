class Order < ApplicationRecord

  belongs_to :restaurant
  belongs_to :customer
  has_many :line_items, dependent: :destroy, after_add: :increase_total, after_remove: :decrease_total

  def increase_total(line_item)
    update_column(:total_amount_in_cents, (total_amount_in_cents || 0) + line_item.buying_price_in_cents * line_item.quantity)
  end

  def decrease_total(line_item)
    update_column(:total_amount_in_cents, total_amount_in_cents - line_item.buying_price_in_cents * line_item.quantity)
  end

  def total_amount
    total_amount_in_cents / 100
  end

end
