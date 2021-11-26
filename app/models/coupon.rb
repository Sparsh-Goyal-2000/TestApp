class Coupon < ApplicationRecord

  belongs_to :user

  validates :code, :description, :expiry_date, presence: true

end
