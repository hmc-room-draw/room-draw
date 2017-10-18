Rails.application.routes.draw do
  resources :room_assignments
  resources :users
  resources :dorms
  resources :rooms
  resources :suites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'admin/map', to: 'admin#map'

  post 'admin/map', to: 'admin#edit_mark'

  resources :sessions, only: [:create, :destroy]
  resource :login, only: [:show]

  resources :users, :rooms, :suites, :dorms



  root to: "login#show"
end
