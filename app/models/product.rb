class Product < ApplicationRecord

  belongs_to :category
  has_one :restaurant, through: :category
  has_many :line_items, dependent: :restrict_with_error

  has_many :combo_products, foreign_key: :combo_id, dependent: :destroy
  has_many :products, through: :combo_products

  validates :name, :price_in_cents, :kind, :position, presence: true
  validates :name, uniqueness: { scope: :category_id }, allow_blank: true
  validates :kind, inclusion: { in: %w(Food Drink Combo) }, allow_blank: true
  validates :price_in_cents, :position, numericality: {
    only_integer: true,
    greater_than: 0
  }, allow_nil: true

  scope :foods, -> { where kind: 'Food' }
  scope :drinks, -> { where kind: 'Drink' }
  scope :combos, -> { where kind: 'Combo' }
  scope :available, -> { where is_available: true }
  scope :in_stock, -> { where in_stock: true }

  def price
    price_in_cents / 100.0
  end

end
