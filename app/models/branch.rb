class Branch < ApplicationRecord

  has_many :tables, dependent: :restrict_with_error
  has_many :products, -> { includes(:product) }, class_name: :BranchProduct
  has_many :reservations, dependent: :restrict_with_error

  validates :address, :contact, presence: true
  validates :address, uniqueness: true

end
