Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/user_pathways/:id/signup", to: "user_pathways#signup", as: "signup"
  root "pages#home"
  resources :pathways do
    resources :challenges, only: %w[show new create edit update]
    resources :path_challenges, only: %w[new create edit update]
    resources :user_pathways, only: :create
  end

  resources :profile, only: %w[show] do
    resources :user_challenges, only: %w[show]
  end

  resources :challenges, only: %w[destroy]
  resources :user_challenges, only: %w[destroy]
  resources :path_challenges, only: %w[destroy]

  get "/user_pathway/:id", to: "user_pathways#approved", as: "approved"
end
