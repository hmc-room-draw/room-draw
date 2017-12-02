Rails.application.routes.draw do

  get 'coming_soon', to: 'static_pages#coming_soon'

  get 'pulls/:id/new', to: 'room_assignments#new_from_pull'

  get 'login/show'

  # Admin Room Assignments form
  post 'dorms/:id', to: 'admin#edit_mark'
  post 'dorms/:id/load_pull_ajax/:pull_id', to: 'dorms#load_pull_ajax'
  get 'dorms/:id', to: 'dorms#show'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'

  #routes for admin landing page
  get 'admin/students', to: 'students#index'
  get 'admin/users', to: 'users#index'
  post 'admin/uploadRoster', to: 'static_pages#uploadRoster'
  post 'admin/downloadNonParticipants', to: 'static_pages#downloadNonParticipants'
  post 'admin/downloadPlacements', to: 'static_pages#downloadPlacements'
  resources :draw_periods, only: [:create, :update, :destroy]

  resources :dorms
  resources :emails
  resources :pulls
  resources :rooms
  resources :suites

  resources :room_assignments
  resources :students

  resources :users do
    collection { post :import }
  end

  resources :sessions, only: [:create, :destroy]

  root "static_pages#home"
  # Add dormlookup route
  get '/dormLookup', to: 'static_pages#dormLookup'
end
