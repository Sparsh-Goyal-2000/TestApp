class User < ApplicationRecord

  has_many :coupons, dependent: :destroy_async

  validates :name, :email, presence: true
  validates :email, uniqueness: true

end
