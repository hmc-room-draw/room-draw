Rails.application.routes.draw do
	root 'static_pages#home'

  get 'dorms/atwood'

  get 'dorms/case2'

  get 'dorms/case'

  get 'login/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'

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
