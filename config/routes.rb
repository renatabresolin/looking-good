Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :products, shallow: true do
    resources :rentals
  end
end
