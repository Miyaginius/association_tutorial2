Rails.application.routes.draw do
  get '/top', to: 'homes#top'
  get '/about', to: 'homes#about'
  root 'tweets#index'
  devise_for :users
  resources :tweets, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :comments, only: [:create, :destroy]
  end
  resources :users do
  	resource :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
    get :search, on: :collection
  end
  get '/users/favorites/:id', to: 'users#favorites', as: 'favorites_user'
end
