Rails.application.routes.draw do
  devise_for :users

  get "/user_pathways/:id/signup", to: "user_pathways#signup", as: "signup"
  root "pages#home"
  resources :pathways do
    resources :challenges, only: %w[show new create edit update]
    resources :path_challenges, only: %w[new create edit update]
    resources :user_pathways, only: :create
  end

  resources :profiles, only: %w[show edit] do
    resources :user_pathways, only: %w[show] do
      resources :user_challenges, only: %w[show]
    end
  end

  resources :user_challenges, only: %w[index show] do
    resources :notes, only: %w[new create edit update]
    resources :comments, only: %w[new create edit update]
  end
  resources :notes, only: :destroy

  resources :challenges, only: %w[destroy]
  resources :user_challenges, only: %w[destroy]
  resources :path_challenges, only: %w[destroy]
  resources :comments, only: %(destroy)
end
