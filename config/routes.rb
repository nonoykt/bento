Rails.application.routes.draw do

  resources :products

  devise_for :shops,
    path: 'shops',
    controllers: {
      confirmations: 'shops/confirmations',
      passwords: 'shops/passwords',
      sessions: 'shops/sessions',
      registrations: 'shops/registrations'}
  resources :shops

  devise_scope :shop do
    get 'sign_in', to: 'shops/sessions#new'
    get 'sign_out', to: 'shops/sessions#destroy'
  end

  devise_for :users,
    path: 'users',
    controllers: {
      confirmations: 'users/confirmations',
      omniauth: 'users/omniauth',
      passwords: 'users/passwords',
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'}
  root to: 'users#index'

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end
  resources :users
end
