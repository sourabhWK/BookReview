Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :books

  
  get 'reviews/new/:id', to: 'reviews#new', as: "new_review"


  resources :reviews, except: %i[new]
  resources :likes, only: [:destroy, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
