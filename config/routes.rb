Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
