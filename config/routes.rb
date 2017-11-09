Rails.application.routes.draw do
  
  resources :emails
  get 'emails/new', to: 'draw_periods#sendEmails'

  get 'emails/index'

  get 'emails/show', to: 'draw_periods#viewEmails'

  get 'emails/create'

  # temporary route of landing page
  post 'emails/download_non_participants'

  get 'login/show'

  # Admin Room Assignments form
  post 'dorms/:id', to: 'admin#edit_mark'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'

  #routes for admin landing page
  get 'admin/home', to: 'draw_periods#admin_landing_page'
  post 'admin/uploadRoster', to: 'draw_periods#uploadRoster'
  post 'admin/downloadStudents', to: 'draw_periods#downloadStudents'
  post 'admin/downloadNonParticipants', to: 'draw_periods#downloadNonParticipants'
  post 'admin/downloadPulls', to: 'draw_periods#downloadPulls'
  post 'admin/setStartEndDate', to: 'draw_periods#setStartEndDate'

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

  root "sessions#new"
end
