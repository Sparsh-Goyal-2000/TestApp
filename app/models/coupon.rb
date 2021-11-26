class Coupon < ApplicationRecord

  belongs_to :user

  validates :code, :expiry_date, presence: true
  validates :code, uniqueness: { case_sensitive: false }

  enum status: [:active, :expired]

end
