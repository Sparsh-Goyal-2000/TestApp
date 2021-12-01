namespace :coupons do
  desc "Create coupons for all the users"
  task create: :environment do
    User.find_each do |user|
      unique_code = loop do
        random_code = Faker::Code.unique.asin
        break random_code unless Coupon.exists?(code: random_code)
      end
      coupon = user.coupons.create(code: unique_code, description: 'Special Off', start_at: DateTime.current, expire_at: DateTime.current + 1.day)
      puts "Created coupon code #{coupon.code} for user #{user.name}"
    end
  end

  desc "Send coupons to all users"
  task send: :environment do
    User.find_each do |user|
      if user.active_coupons.exists?
        coupon = user.active_coupons.order(:expire_at).first
        puts "Sending mail to #{user.name} with code #{coupon.code}"
        CouponMailer.send_coupon_code(user, coupon).deliver_later
      end
    end
  end
end
