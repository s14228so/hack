Rails.application.routes.draw do
  devise_for :student, only: []

  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resources :students, only: [:index , :create]
  end

 namespace :api, defaults: { format: :json } do
  namespace :students do
    resource :sign_out, only: [:destroy], controller: :sessions
    resource :sign_in, only: [:create], controller: :sessions # api/users/sign_in
  end
  get "/student" => "students#show"
  get "/myteams" => "teams#show"
  resources :students, only: [:index]
  resources :events, only: [:index, :create, :show] do
     get 'myhacks', on: :collection
     get 'join_students', on: :member
  end
  resources :event_students, only: [:index, :create]
end
end