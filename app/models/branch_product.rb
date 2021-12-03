class BranchProduct < ApplicationRecord

  belongs_to :branch
  belongs_to :product

  validates :price_in_cents, presence: true

  def price
    price_in_cents / 100.0
  end

end
