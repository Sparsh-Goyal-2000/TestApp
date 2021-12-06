class User < ApplicationRecord

  has_many :coupons, dependent: :destroy
  has_many :active_coupons, -> { active }, class_name: :Coupon
  has_one :first_active_coupon, -> { active.order(:expire_at) }, class_name: :Coupon

  validates :name, :email, presence: true
  validates :email, uniqueness: true

end
