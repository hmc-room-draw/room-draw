Rails.application.routes.draw do
  get 'dorms/atwood'

  get 'dorms/case2'

  get 'dorms/case'

  resources :pulls
  resources :room_assignments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'admin', to: 'admins#dashboard'

  post 'admin/uploadRoster', to: 'admins#uploadRoster'
  post 'admin/downloadStudents', to: 'admins#downloadStudents'
  post 'admin/downloadPulls', to: 'admins#downloadPulls'
  post 'admin/setStart', to: 'admins#setStart'
  post 'admin/setEnd', to: 'admins#setEnd'

  resources :sessions, only: [:create, :destroy]
  resource :login, only: [:show]

  resources :users
  resources :dorms
  resources :rooms
  resources :suites

  root to: "login#show"
end
