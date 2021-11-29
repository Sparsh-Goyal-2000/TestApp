class Branch < ApplicationRecord

  has_many :reservations, dependent: :restrict_with_error

  validates :address, :contact, presence: true
  validates :address, uniqueness: true

end
