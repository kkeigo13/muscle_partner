Rails.application.routes.draw do
  devise_for :users
  root    'users#index'
  resources :users, :path => 'user'
  resources :tweets, :path => 'tweet'
  resources :menus, only: [:index, :new, :create, :destroy]
end
