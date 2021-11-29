desc "it sends coupon code to all users"
task send_coupons: :environment do
  User.find_each do |user|
    if user.active_coupons.exists?
      coupon = user.active_coupons.first
      puts "Sending mail to #{user.name} with code #{coupon.code}"
      CouponMailer.send_coupon_code(user, coupon).deliver_later
    end
  end
end
