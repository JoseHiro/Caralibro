Rails.application.routes.draw do
  root to: "pages#home"
  get '/contact' => "pages#contact"
  get 'users/index'
  get 'users/show'
  get 'users/setting', to: "users#setting"

  devise_for :users

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
  end

  # resources :users, :only => [:index, :show]



end
