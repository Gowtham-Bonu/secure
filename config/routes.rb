Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "accounts#index"

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"
  resources :users, only: :create
  resources :accounts, except: [:destroy, :edit, :update]
end
