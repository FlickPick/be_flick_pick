Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users
      resources :parties
      resources :temp_users, only: [:create, :index]
      resources :sessions, only: [:create, :destroy]
      resources :movies, only: [:index, :show]
    end
  end
end
