class Product < ApplicationRecord

  has_many :line_items, dependent: :restrict_with_error

  validates :name, :price, presence: true
  validates :name, uniqueness: true

end
