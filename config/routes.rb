Rails.application.routes.draw do
  

  devise_for :users, controllers: { registrations: 'users/registrations' }

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?



  root to: "user#home"
  

  namespace :admin do
  resources :tasks
end

resources :contractor, only: [:show, :edit, :update, :destroy] do
  collection do
    get 'home'
  end
end


get  'worker/home',               to: 'worker#home',            as: 'worker_home'
get  'worker/task/:id/apply',     to: 'worker#apply',           as: 'worker_apply_task'
post 'worker/task/:id/apply',     to: 'worker#create_application', as: 'create_worker_application'




  get "/user_index" => "user#index"

  get "/user_profile" => "user#new"
  post "/user_profile"=> "user#create"

  get "/all_workers" => "worker#index"
  get "/all_contractors" => "contractor#index"

  get "/all_users" => "user#index"

  get "/contractor_home" => "contractor#home"
  get "/worker_home" => "worker#home"


  get "/new_task" => "task#new"
  post "/new_task" => "task#create"

  get "/new_category" => "category#new"
  post "/new_category" => "category#create"


  get "/new_application" => "application1#new"
  post "/new_application" => "application1#create"


 
   get "tasks/:id/edit", to: "task#edit", as: "edit_task"
 


  namespace :admin do
  root to: "dashboard#index"

  resources :users, only: [ :index, :show, :destroy ]
  resources :tasks, only: [ :index, :show,:edit,:update, :destroy ]
  resources :categories, only: [ :index, :show,:edit, :update, :destroy ]
end


get "/tasks" => "task#index"


get '/search_category' => "tasks#search"


  resources :tasks do
    get 'search', on: :collection # Add the search action to the tasks resources
  end


  namespace :admin do
    resources :tasks
  end



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
