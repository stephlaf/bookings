Rails.application.routes.draw do
  get 'bookings/create'
  devise_for :users
  
  root to: 'pages#home'
  resources :item do
    resources :bookings, only: :create
  end
end
