desc "it sends coupon code to all users"
task send_coupon_code: :environment do
  User.find_each do |user|
    coupon  = Coupon.find_by(user: user)
    puts "Sending mail to #{user.name} with code #{coupon.code}"
    CouponMailer.send_coupon_code(user, coupon).deliver_later
  end
end
