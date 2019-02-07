Rails.application.routes.draw do
  root "home#index"

  devise_for :admin,
  controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :students, path: '', path_names: { sign_in: "login", sign_up: "/sign_up"},
  controllers: {
    sessions:      'students/sessions',
    passwords:     'students/passwords',
    registrations: 'students/registrations'
  }
  devise_for :companies, controllers: {
    sessions:      'campanies/sessions',
    passwords:     'campanies/passwords',
    registrations: 'campanies/registrations'
  }

    namespace :api, defaults: { format: :json } do
    resources :students
  end

  resources :students

  get "mypage" => "students#show"
  get "home" => "students#show"



end
