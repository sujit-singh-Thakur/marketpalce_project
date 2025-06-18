Rails.application.routes.draw do
  devise_for :users

  root to: "users#home"

mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?



get  "worker/home",               to: "workers#home",            as: "worker_home"
get  "worker/task/:id/apply",     to: "workers#apply",           as: "worker_apply_task"
post "worker/task/:id/apply",     to: "workers#create_application", as: "create_worker_application"


get "contractor/tasks/:id/applied_workers", to: "contractors#applied_workers", as: "contractor_applied_workers"

patch "/contractor/applications/:id/status", to: "contractors#update_status", as: "update_application_status"

get "contractor/applications", to: "contractors#applications", as: :contractor_applications
get "contractor/:id", to: "contractors#show", as: :contractor_view

get "worker/my_applications", to: "workers#my_applications", as: :worker_my_applications


resources :tasks, only: [ :index, :new, :create, :edit, :update, :destroy ]

  get "/new_task" => "tasks#new"
  post "/new_task" => "tasks#create"



  get "/new_application" => "application1s#new"
  post "/new_application" => "application1s#create"



    resources :contractors do
      get "applications", on: :collection
    end
    resources :contractors, only: [ :index, :show, :edit, :update, :destroy ]
    resources :workers, only: [ :index, :show, :edit, :update, :destroy ]

    resources :categories, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]


  namespace :admin do
  root to: "dashboard#index"

  resources :users, only: [ :index, :edit, :update, :show, :destroy ]
  resources :tasks, only: [ :index, :show, :edit, :update, :destroy ]
  resources :categories, only: [ :index, :show, :edit, :update, :destroy ]
end



  resources :tasks do
    get "search", on: :collection
  end

   get "/contractor_home" => "contractors#home"


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
