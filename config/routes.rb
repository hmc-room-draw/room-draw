Rails.application.routes.draw do

  #resources for mailing 
  resources :emails
  get 'emails/new'

  get 'emails/index'

  get 'emails/show'

  get 'emails/create'

  resources :users
  #match '/reminder' => 'adminpage#reminder', :via => [:get]
  get 'adminpage/reminder'
  post 'adminpage/clicked'
  post 'adminpage/download_users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
