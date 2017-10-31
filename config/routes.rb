Rails.application.routes.draw do
  resources :addresses
  resources :phone_numbers
  resources :calls, only: :create do
    resources :voice_auths, only: :create
  end

  resources :users, only: [] do
    resources :calls, only: [:index, :show, :destroy] do
      resources :contact_recognitions, only: :create
      resources :voice_auths, only: :create
    end
  end

  namespace :admin do
    resources :users
    resources :contacts
    resources :phone_numbers
    resources :addresses
    resources :calls
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users

  namespace :my do
    resources :contacts
  end
end
