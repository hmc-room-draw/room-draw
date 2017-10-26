Rails.application.routes.draw do

  get 'dorms/linde2'

  get 'dorms/linde'

  get 'dorms/atwood3'

  get 'dorms/atwood2'

  get 'dorms/atwood'

  get 'dorms/case'

  get 'dorms/case2'

  get 'dorms/east2'

  get 'dorms/west2'

  get 'dorms/west'

  get 'dorms/east'

  get 'dorms/south2'

  get 'dorms/south'

  get 'dorms/north2'

  get 'dorms/north'
  get 'login/show'

  resources :pulls
  resources :room_assignments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'

  resources :sessions, only: [:create, :destroy]

  resources :users
  resources :dorms
  resources :rooms
  resources :suites
  resources :students

  root "sessions#new"
 end