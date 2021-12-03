class Product < ApplicationRecord

  has_many :branch_products, dependent: :destroy
  has_many :branches, through: :branch_products
  has_many :line_items, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

end
