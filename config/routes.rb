Rails.application.routes.draw do
  resources :proponents
  get 'proponent/inss_discount', to: 'proponents#inss_discount'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
