Rails.application.routes.draw do
  devise_for :student, only: []
  devise_for :company, only: []

  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resource :logout, only: [:destroy], controller: :sessions
    resources :students, only: [:index , :create, :update, :show] do
      get "current", on: :member
      get "one", on: :member
      post "image", on: :member
    end
    resources :teams do 
      get "one", on: :member
    end

    delete "/:event_id/:student_id" => "event_students#destroy"
    get "/myteams" => "teams#show"
    resources :event_students, only: [:create]
    resources :events, only: [:index , :create, :show] do
      get 'join_students', on: :member
      get 'myhacks', on: :collection
    end
  end
end