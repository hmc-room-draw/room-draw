Rails.application.routes.draw do
  get 'dorms/atwood'

  get 'dorms/case2'

  get 'dorms/case'

  get 'login/show'

  get 'admin/map'
  get 'admin/case'
  post 'admin/case', to: 'admin#edit_mark'

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
