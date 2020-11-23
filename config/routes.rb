Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :clothes, shallow: true do
    resources :rentals
  end
end
