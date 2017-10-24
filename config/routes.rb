Rails.application.routes.draw do
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
    resources :calls
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users

  namespace :my do
    resources :contacts
  end
end
