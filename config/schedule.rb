every 1.day, at: '12:00 am' do
  rake 'expire_coupons'
end

every 1.day, at: '09:00 am' do
  rake 'create_coupons'
end

every 1.day, at: '10:00 am' do
  rake 'send_coupons'
end
