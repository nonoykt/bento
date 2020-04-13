Rails.application.routes.draw do

  resources :products

  devise_for :shops,
    path: 'shops',
    controllers: {
      sessions: 'shops/sessions',
      registrations: 'shops/registrations'
    }
  resources :shops

  devise_for :users,
    path: 'users',
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  root to: 'users#index'
  resources :users
end
