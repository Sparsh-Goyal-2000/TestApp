class Product < ApplicationRecord

  belongs_to :category
  has_one :restaurant, through: :category
  has_many :line_items, dependent: :restrict_with_error

  has_many :combo_products, foreign_key: :combo_id
  has_many :products, through: :combo_products

  validates :name, :price_in_cents, presence: true
  validates :name, uniqueness: { scope: :category_id }

  def price
    price_in_cents / 100
  end

end
