Rails.application.routes.draw do
	root 'static_pages#home'
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
    resources :users

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
