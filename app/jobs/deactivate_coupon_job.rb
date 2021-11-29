class DeactivateCouponJob < ApplicationJob
  queue_as :default

  def perform(*coupons)
    coupons.each do |coupon|
      coupon.update(status: 'expired')
    end
  end
end
