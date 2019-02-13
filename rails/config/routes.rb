Rails.application.routes.draw do
  namespace :api do
    get 'teams/index'
    get 'teams/show'
  end
  root "students#show"

#test__

# authenticated :user do
#     # ログイン済みの場合のルート
#     users_route = 'home#index'
#     root users_route
# end

  devise_for :admin,
  controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :students,
    path: '', path_names: { sign_in: "/login", sign_up: "/sign_up"},
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

  resources :students
  # resources :events
  get "/event/:id" => "events#show"
  get "/mypage" => "students#show"
  get "/team" => "teams#show"
  get "/myhacks" => "students#show"
  get "/login" => "students#show", as: :login_path
  get "/calendar" => "students#show"
  

end