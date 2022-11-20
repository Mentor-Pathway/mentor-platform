Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  resources :pathways do
    resources :challenges, only: %w[show new create edit update]
    resources :path_challenges, only: %w[new create edit update]
  end

  resources :profiles, only: %w[show edit update] do
    resources :user_challenges, only: %w[show]
  end

  resources :challenges, only: %w[destroy]
  resources :user_challenges, only: %w[destroy]
  resources :path_challenges, only: %w[destroy]

  get "/user_pathway/:id", to: "user_pathways#approved", as: "approved"
end
