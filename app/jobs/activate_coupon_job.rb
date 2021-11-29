class ActivateCouponJob < ApplicationJob
  queue_as :default

  def perform(*coupons)
    coupons.each do |coupon|
      coupon.update(status: 'active')
    end
  end
end
