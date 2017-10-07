class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def homePage
  	render html: "home page"
  end
end
