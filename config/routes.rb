Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  get 'users/show'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :rooms
end
