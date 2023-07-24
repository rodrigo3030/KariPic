Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/") 
  root "home#index"

  # Devise routes for users (grouped together)
  devise_for :users

  # Your custom routes
  resources :posts, except: [:index]
  resources :reactions, only: [:create, :destroy]
  get '/posts', to: 'posts#index', as: 'user_root'
  get '/default_avatar', to: 'avatars#default', as: :default_avatar
  get '/avatar/:id', to: 'avatars#show', as: 'avatar'
  get 'home/index'
end




