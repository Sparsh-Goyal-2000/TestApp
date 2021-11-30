class Coupon < ApplicationRecord

  belongs_to :user

  validates :code, :start_at, :expire_at, presence: true
  validates :code, uniqueness: { case_sensitive: false }

  scope :active, -> { where("start_at <= :current_time && expire_at >= :current_time", current_time: DateTime.now) }

end
