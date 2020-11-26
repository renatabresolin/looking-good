Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  resources :products, shallow: true do
    resources :rentals
    resources :charges
  end
  patch '/rentals/:rental', to: 'pages#return_product', as: :return_product
  get '/rentals', to: 'pages#rentals', as: :user_rentals
end
