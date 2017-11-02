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
  get 'admin/home', to: 'admin_landing_pages#index'

  post 'admin/uploadRoster', to: 'admin_landing_pages#uploadRoster'
  post 'admin/downloadStudents', to: 'admin_landing_pages#downloadStudents'
  post 'admin/downloadPulls', to: 'admin_landing_pages#downloadPulls'
  post 'admin/setStartEndDates', to: 'admin_landing_pages#setStartEndDates'

  resources :sessions, only: [:create, :destroy]
  resource :login, only: [:show]

  resources :users
  resources :dorms
  resources :rooms
  resources :suites

  root to: "login#show"
end
