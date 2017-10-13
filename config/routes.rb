Rails.application.routes.draw do

  get 'login/show'

  resources :pulls
  resources :room_assignments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'

  resources :sessions, only: [:create, :destroy]

  get 'dorms/case'
  resources :users
  resources :dorms
  resources :rooms
  resources :suites

  root "sessions#new"
end
