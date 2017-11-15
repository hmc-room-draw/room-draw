Rails.application.routes.draw do
  
  resources :emails
  get 'emails/new'

  get 'emails/index'

  get 'emails/show'

  get 'emails/create'

  get 'emails/destory'

  # temporary route of landing page
  post 'emails/download_non_participants'

  get 'dorms/atwood'

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

  resources :draw_periods

  resources :dorms
  resources :pulls
  resources :rooms
  resources :suites

  resources :room_assignments
  resources :students

  resources :users
  resources :sessions, only: [:create, :destroy]

  root "sessions#new"
end
