Rails.application.routes.draw do
  get "users/show"
  resources :tags
  get "homes/index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  mount ActiveStorage::Engine => "/rails/active_storage"

  root to: "homes#index"
  get '/mypage', to: 'users#show'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :comments

  
end
