desc "it creates coupon code for all users"
task expire_coupons: :environment do
  Coupon.active.find_each do |coupon|
    if coupon.expiry_date < Date.today
      coupon.expired!
      puts "Expired coupon #{coupon.code}"
    end
  end
end
