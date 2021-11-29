Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#home_page'
  get 'alert_subscriber', to: 'subscription#alert_subscriber'
end
