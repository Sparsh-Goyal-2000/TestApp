every 1.day, at: '12:00 am' do
  rake 'create_coupons'
  rake 'send_coupons'
end
