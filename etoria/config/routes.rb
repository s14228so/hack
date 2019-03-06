Rails.application.routes.draw do

  root "home#index"

  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
  }


  resources :users do
    resource :profiles
    member do
      get :following, :followers
      get 'photo'
    end
  end
  resources :posts


  resources :relationships, only: [:create, :destroy]
  resources :teams 

  scope :api, { format: 'json' } do
    resources :teams do
      get :search , on: :collection
    end
  end
  resources :blogs
  resources :events
  resources :recruits
  resources :ideas

  get "/top" => "home#top", as: "top"
  get "/main" => "home#main", as: "main"


end
