Rails.application.routes.draw do
  devise_for :users

  root to: "homes#home"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :workers do
    collection do
      get :home
      get :my_applications
    end
  end


  resources :contractors do
    collection do
      get :home
      get :applications
    end
  end

  resources :tasks do
    collection do
      get :search
    end
    get "/new_task" => "tasks#new"
    post "/new_task" => "tasks#create"

    get "/new_application" => "application1s#new"
    post "/new_application" => "application1s#create"
  end


  namespace :admin do
    root to: "dashboard#index"
    resources :users, only: [ :index, :edit, :update, :show, :destroy ]
    resources :tasks, only: [ :index, :show, :edit, :update, :destroy ]
    resources :categories, only: [ :index, :show, :edit, :update, :destroy ]
  end

  resources :categories, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]


  resources :applications do
    resources :payments, only: [ :new, :create ]
  end

  get "/payments/success", to: "payments#success"

  post "/stripe_webhooks", to: "stripe_webhooks#create"

  resources :workers
    get  "worker/task/:id/apply",     to: "workers#apply",           as: "worker_apply_task"
    post "worker/task/:id/apply",     to: "workers#create_application", as: "create_worker_application"


   resources :contractors
    get "contractor/tasks/:id/applied_workers", to: "contractors#applied_workers", as: "contractor_applied_workers"
    patch "/contractor/applications/:id/status", to: "contractors#update_status", as: "update_application_status"


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
