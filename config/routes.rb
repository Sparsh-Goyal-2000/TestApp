Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resource :dashboard, only: :show

  get 'alert_subscriber', to: 'subscription#alert_subscriber'

  root 'dashboards#show'

end
