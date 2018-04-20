Rails.application.routes.draw do


  #root "static_page#home"
  post "/signup", to: "user#create"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :categories, only: :create
end
