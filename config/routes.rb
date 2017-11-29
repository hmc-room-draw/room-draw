Rails.application.routes.draw do
  
  resources :emails
  get 'emails/new', to: 'draw_periods#sendEmails'

  get 'emails/index'

  get 'emails/show', to: 'draw_periods#viewEmails'

  get 'emails/create'

  # temporary route of landing page
  post 'emails/download_non_participants'

    get  '/help',    to: 'static_pages#help'
    get  '/about',   to: 'static_pages#about'
    get  '/contact', to: 'static_pages#contact'
    get  '/signup',  to: 'users#new'

    get '/launch', to: 'static_pages#launch'

    # dorm pages to redirect to from campus map
    get '/south', to: 'static_pages#south'
    get '/north', to: 'static_pages#north'
    get '/east',  to: 'static_pages#east'
    get '/west',  to: 'static_pages#west'

    get '/linde', to: 'static_pages#linde'
    get '/atwood', to: 'static_pages#atwood'
    get '/case',   to: 'static_pages#case'
    get '/sontag', to: 'static_pages#sontag'
    get '/drinkward', to: 'static_pages#drinkward'

  get'/launch', to: 'static_pages#launch'

  get 'dorms/atwood'

  get '/dormLookup', to: 'static_pages#dormLookup'

  get 'dorms/case2'

  get 'dorms/case'

  get 'login/show'

  get 'admin/map'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'

  post 'admin/map', to: 'admin#edit_mark'

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

  resources :users do
    collection { post :import }
  end
  
  resources :sessions, only: [:create, :destroy]

  root "static_pages#home"
end
