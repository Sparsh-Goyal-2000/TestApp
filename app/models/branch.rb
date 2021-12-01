class Branch < ApplicationRecord

  has_many :reservations, dependent: :restrict_with_error
  has_many :tables, dependent: :destroy
  has_many :products, -> { includes(:product) }, class_name: :BranchProduct, dependent: :destroy

  validates :address, :contact, presence: true
  validates :address, uniqueness: true

end
