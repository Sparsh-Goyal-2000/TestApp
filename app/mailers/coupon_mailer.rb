class CouponMailer < ApplicationMailer
  default from: 'special_coupons@gmail.com'

  def send_coupon_code(user, coupon)
    @user = user.name
    @coupon = coupon
    mail to: user.email, subject: 'Special Coupon Code'
  end
end
