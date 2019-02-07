Rails.application.routes.draw do
  root "students#show"



authenticated :user do
    # ログイン済みの場合のルート
    users_route = 'home#index'
    root users_route
end

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
    namespace :students do
    resource :sign_out, only: [:destroy], controller: :sessions
    resource :sign_in, only: [:create], controller: :sessions # api/users/sign_in
  end
end

  resources :students

  get "mypage" => "students#show"
  get "home" => "students#show"
  get "login" => "students#show"

end
