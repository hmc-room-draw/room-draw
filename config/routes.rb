Rails.application.routes.draw do
<<<<<<< HEAD
  get 'dorms/atwood'

  get 'dorms/case2'

  get 'dorms/case'

  get 'login/show'

  resources :pulls
  resources :room_assignments
=======
	resources 'contacts', only: [:new, :create], path_names: { new: '' }
	if Rails.env.development?
	  mount LetterOpenerWeb::Engine, at: "/letter_opener"
	end
>>>>>>> hyobinyou
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
