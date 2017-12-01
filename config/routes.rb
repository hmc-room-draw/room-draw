Rails.application.routes.draw do
  
  resources :emails
  get 'emails/new', to: 'draw_periods#sendEmails'
  get 'emails/index'
  get 'emails/show', to: 'draw_periods#viewEmails'
  get 'emails/create'
  get 'emails/:id/edit', to: 'draw_periods#edit'
  delete 'emails/:id', to: 'draw_periods#destroy'

  get 'pulls/:id/new', to: 'room_assignments#new_from_pull'

  get 'login/show'

  # Admin Room Assignments form
  post 'dorms/:id', to: 'admin#edit_mark'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'

  #routes for admin landing page
  get 'admin/home', to: 'draw_periods#admin_landing_page'
  get 'admin/students', to: 'students#index'
  post 'admin/uploadRoster', to: 'draw_periods#uploadRoster'
  post 'admin/downloadNonParticipants', to: 'draw_periods#downloadNonParticipants'
  post 'admin/downloadPlacements', to: 'draw_periods#downloadPlacements'

  resources :draw_periods

  resources :dorms
  resources :pulls
  resources :rooms
  resources :suites

  resources :room_assignments
  resources :students

  resources :admin_students

  resources :users do
    collection { post :import }
  end
  
  resources :sessions, only: [:create, :destroy]

  root "static_pages#home"
  # Add dormlookup route
  get '/dormLookup', to: 'static_pages#dormLookup'
end
