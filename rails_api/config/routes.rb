Rails.application.routes.draw do
  devise_for :student, only: []

  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resource :logout, only: [:destroy], controller: :sessions
    resources :students, only: [:index , :create]
    resources :events, only: [:index , :create] do
      get 'myhacks', on: :collection
    end
  end

 namespace :api, defaults: { format: :json } do
    get "/student" => "students#show"
    get "/myteams" => "teams#show"
    resources :students, only: [:index]
    resources :events, only: [:index, :create, :show] do
       
       get 'join_students', on: :member
    end
    resources :event_students, only: [:index, :create]
  end
end