Rails.application.routes.draw do
  devise_for :student, only: []

  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resource :logout, only: [:destroy], controller: :sessions
    resources :students, only: [:index , :create] do
      get "current", on: :member
    end
    resources :event_students, only: [:create]
    resources :events, only: [:index , :create] do
      get 'join_students', on: :member
      get 'myhacks', on: :collection
    end
  end
end