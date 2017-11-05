Rails.application.routes.draw do

  #resources for mailing
  resources :emails
  get 'emails/new'

  get 'emails/index'

  get 'emails/show'

  get 'emails/create'

  resources :users
  resources :dorms
  resources :rooms
  resources :suites

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Admin page actions
  #match '/reminder' => 'adminpage#reminder', :via => [:get]
  get 'adminpage/reminder'
  post 'adminpage/clicked'
  post 'adminpage/download_users'
  post 'adminpage/download_non_participants'
  post 'adminpage/download_placements'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:create, :destroy]
  resource :login, only: [:show]

  resources :users, :rooms, :suites, :dorms

  root to: "login#show"
end
