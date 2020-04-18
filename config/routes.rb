Rails.application.routes.draw do

  root to: 'products#index'

# <--products-->
  resources :products

# <--shops-->
  devise_for :shops,
    path: 'shops',
    controllers: {
      confirmations: 'shops/confirmations',
      passwords: 'shops/passwords',
      sessions: 'shops/sessions',
      registrations: 'shops/registrations'}
  devise_scope :shop do
    get 'sign_in', to: 'shops/sessions#new'
    get 'sign_out', to: 'shops/sessions#destroy'
  end

  resources :shops

# <--users-->
  devise_for :users,
    path: 'users',
    controllers: {
      confirmations: 'users/confirmations',
      omniauth: 'users/omniauth',
      passwords: 'users/passwords',
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'}

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end

  resources :users

end
