Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  root to: "pages#home"
  devise_for :users
  # controllers: {
  #   sessions: 'users/sessions',
  #   registration: 'users/registrations'
  # }
  resources :users, :only => [:index, :show]
  resources :posts, only:[:index, :new, :show, :create, :destory, :edit, :update] do
    resources :favorites, only: [:create, :destroy]
  end
end
