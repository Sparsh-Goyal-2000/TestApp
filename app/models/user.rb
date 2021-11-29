class User < ApplicationRecord

  has_many :coupons, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def active_coupons
    coupons.active
  end

end
