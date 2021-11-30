desc "it creates coupon code for all users"
task create_coupons: :environment do
  User.find_each do |user|
    coupon = Coupon.create(code: Faker::Code.asin, description: 'Special Off', start_at: DateTime.now, expire_at: DateTime.now + 1.day, user: user)
    puts "Created coupon code #{coupon.code} for user #{user.name}"
  end
end
