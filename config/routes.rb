Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
get "users/show" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :rooms
  # resources :reservations
  resources :reservations do
    collection do
      post :confirm
    end
  end  
  resources:users
end
