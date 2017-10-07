Rails.application.routes.draw do

	resources :forms

	root 'application#homePage'

end

