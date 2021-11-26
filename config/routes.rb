Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#home_page'

  get 'expire_coupons', to: 'application#expire_coupons'
  get 'create_coupons', to: 'application#create_coupons'
  get 'send_coupons', to: 'application#send_coupons'

end
