Rails.application.routes.draw do
  #This routes are created when 'profile_controller' is generated.
  #You can delete these when you work on the routes/resources.
  get 'profiles/show'
  get 'profiles/new'
  get 'profiles/create'
  get 'profiles/edit'
  get 'profiles/update'
  ################################################################

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
end
