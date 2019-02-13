Rails.application.routes.draw do
  devise_for :student, only: []

  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resources :students, only: [:index , :create]
  end
end