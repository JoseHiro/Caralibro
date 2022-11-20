Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  root to: "pages#home"
  devise_for :users
  # controllers: {
  #   sessions: 'users/sessions',
  #   registration: 'users/registrations'
  # }

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :users, :only => [:index, :show]
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
  end
  # resources :likes, only: [:create, :destroy]
end
