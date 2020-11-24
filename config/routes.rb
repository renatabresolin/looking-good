Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  resources :products, shallow: true do
    resources :rentals
  end
end
