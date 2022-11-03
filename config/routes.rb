Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  resources :pathways, only: %w[index show new edit destroy] do
    resources :challenges, only: %w[show]
  end

  resources :profile, only: %w[show] do
    resources :user_challenges, only: %w[show]
  end

  resources :challenges, only: %w[destroy]
  resources :user_challenges, only: %w[destroy]
end
