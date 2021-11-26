desc "it creates coupon code for all users"
task create_coupons: :environment do
  User.find_each do |user|
    coupon = Coupon.create(code: Faker::Code.asin, description: 'Special Off', expiry_date: Date.today, status: 0, user: user)
    puts "Created coupon code #{coupon.code} for user #{user.name}"
  end
end
