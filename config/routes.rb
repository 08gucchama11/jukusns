Rails.application.routes.draw do
  scope module: :students do
    root "sessions#new"
    resource :session, path: "", only: %i[create destroy]
    post "guest_login", to: "sessions#guest_login", as: :guest_login
    get "dashboard", to: "dashboards#index"
    resources :announcements, only: %i[index]
    resources :instruction_records, only: %i[index show]
  end

  namespace :teachers do
    get "/", to: "sessions#new", as: :login
    resource :session, path: "", only: %i[create destroy]
    get "dashboard", to: "dashboards#index"
    resources :students, only: %i[index show]
    resources :instruction_records, only: %i[index new create edit update]
  end

  namespace :admin do
    get "/", to: "sessions#new", as: :login
    resource :session, path: "", only: %i[create destroy]
    get "dashboard", to: "dashboards#index"
    resources :instruction_records, only: %i[index]
    resources :posts, only: %i[index show destroy]
    resources :students, only: %i[index new create show edit update]
    resources :teachers, only: %i[index new create show edit update]
    resources :announcements, only: %i[index create]
  end

  namespace :sns do
    root "posts#index"
  end
end
