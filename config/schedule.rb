every 1.day, at: '12:00 am' do
  rake 'coupons:create'
  rake 'coupons:send'
end
