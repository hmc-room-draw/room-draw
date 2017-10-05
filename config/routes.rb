Rails.application.routes.draw do
  resources :users
  #match '/reminder' => 'adminpage#reminder', :via => [:get]
  get 'adminpage/reminder'
  post 'adminpage/clicked'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
