Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get 'user'       => 'users#index'
  get 'tweet'      => 'tweets#index'
  get 'tweet/new'  => 'tweets#new'
  post 'tweet'     => 'tweets#create'
  delete 'tweet/:id' =>'tweets#destroy'
  resources :menus, only: [:index, :new, :create, :destroy]
end
