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
      resources :liked_movies, only: [:create, :index]

      get "/parties/:id/details", to: "parties#details"
      post "/sessions/github_create", to: "sessions#github_create"
     

      mount ActionCable.server => '/cable'
    end
  end
end
