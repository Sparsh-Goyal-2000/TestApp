class Coupon < ApplicationRecord

  belongs_to :user

  validates :code, :start_at, :expire_at, presence: true
  validates :code, uniqueness: { case_sensitive: false }

  after_create_commit :schedule_activation_deactivation

  scope :active, -> { where status: 'active' }

  def active?
    start_at <= DateTime.now && expire_at >= DateTime.now
  end

  private def schedule_activation_deactivation
    ActivateCouponJob.set(wait_until: start_at).perform_later(self)
    DeactivateCouponJob.set(wait_until: expire_at).perform_later(self)
  end

end
