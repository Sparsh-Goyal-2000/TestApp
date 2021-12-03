class Branch < ApplicationRecord

  has_many :reservations, dependent: :restrict_with_error
  has_many :tables, dependent: :destroy
  has_many :branch_products, dependent: :destroy
  has_many :products, through: :branch_products

  validates :address, :contact, presence: true
  validates :address, uniqueness: true

end
