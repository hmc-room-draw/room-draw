Rails.application.routes.draw do
	resources 'contacts', only: [:new, :create], path_names: { new: '' }
	if Rails.env.development?
	  mount LetterOpenerWeb::Engine, at: "/letter_opener"
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
