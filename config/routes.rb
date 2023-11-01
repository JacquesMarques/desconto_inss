Rails.application.routes.draw do
  devise_for :users
  resources :proponents
  get 'proponent/inss_discount', to: 'proponents#inss_discount'

  root 'home#index'

  get 'home/calcule_inss_discount', to: 'home#calcule_inss_discount'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
