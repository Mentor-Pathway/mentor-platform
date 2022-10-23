Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  resources :pathways, only: %w[index show] do 
    resources :challenges, only %w[index]
  end

  resources :profile, only %w[show] do
    resources :user_challenges, %w[show]
  end


end
