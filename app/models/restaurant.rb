class Restaurant < ApplicationRecord

  has_many :categories, dependent: :restrict_with_error
  has_many :products, through: :categories
  has_many :orders, dependent: :restrict_with_error

  validates :name, :address, presence: true
  validates :name, uniqueness: { case_sensitive:  false }

end
