Rails.application.routes.draw do
  resources :dorms
  resources :draw_periods, only: [:create, :update, :destroy]
  resources :emails
  resources :pulls
  resources :rooms
  resources :room_assignments
  resources :sessions, only: [:create, :destroy]
  resources :students
  resources :suites

  resources :users do
    collection { post :import }
  end

  post 'pulls/new', to: 'pulls#new'

  # Ajax for pull forms
  post 'dorms/:id/create_pull_ajax/:selected_rooms', to: 'dorms#create_pull_ajax'
  post 'dorms/:id/create_admin_pull_ajax/:selected_rooms', to: 'dorms#create_admin_pull_ajax'
  post 'dorms/:id/create_admin_multi_pull_ajax/:selected_rooms', to: 'dorms#create_admin_multi_pull_ajax'

  # Admin Room Assignments form
  post 'dorms/:id', to: 'admin#edit_mark'

  # Dorm map page
  # post 'dorms/:id/load_pull_ajax/:pull_id', to: 'dorms#load_pull_ajax'
  # post 'dorms/:id/pull_num_ajax/:pull_count/:room_index', to: 'dorms#pull_num_ajax'
  get 'dorms/:id', to: 'dorms#show'

  # Pulls
  get 'pulls/:id/new', to: 'room_assignments#new_from_pull'

  # Admin Fake Routes
  get 'admin/students', to: 'students#index'
  get 'admin/users', to: 'users#index'

  # Admin Landing Page Actions
  post 'admin/uploadRoster', to: 'static_pages#uploadRoster'
  post 'admin/downloadNonParticipants', to: 'static_pages#downloadNonParticipants'
  post 'admin/downloadPlacements', to: 'static_pages#downloadPlacements'

  # Google OAuth
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get 'login/show'
  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'

  get 'coming_soon', to: 'static_pages#coming_soon'
  get '/dormLookup', to: 'static_pages#dormLookup'

  root "static_pages#home"
end
