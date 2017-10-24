Rails.application.routes.draw do
  resources :voice_auths, only: :create
  resources :calls, only: :create

  namespace :admin do
    resources :users
    resources :calls
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users

  namespace :my do
    resources :contacts
  end
end
