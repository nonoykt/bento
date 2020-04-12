Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :shops
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
=======
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
>>>>>>> genarating-devise
  root to: 'users#index'
  resources :users
end
