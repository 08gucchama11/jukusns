Rails.application.routes.draw do

  root "students/sessions#new"

  post "/", to: "students/sessions#create"
  delete "/", to: "students/sessions#destroy"

  get "teachers", to: "teachers/sessions#new", as: :new_teacher_session
  post "teachers", to: "teachers/sessions#create", as: :teacher_session
  delete "teachers", to: "teachers/sessions#destroy"

  get "admin", to: "admin/sessions#new", as: :new_admin_session
  post "admin", to: "admin/sessions#create", as: :admin_session
  delete "admin", to: "admin/sessions#destroy"

  get "dashboard", to: "students/dashboards#index"
  get "teachers/dashboard", to: "teachers/dashboards#index"
  get "admin/dashboard", to: "admin/dashboards#index"

  get "admin/dashboard", to: "admin/dashboards#index"
  get "teachers/dashboard", to: "teachers/dashboards#index"
  get "dashboard", to: "students/dashboards#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
