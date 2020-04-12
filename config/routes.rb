Rails.application.routes.draw do
  devise_for :shops
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  root to: 'users#index'
  resources :users
end
