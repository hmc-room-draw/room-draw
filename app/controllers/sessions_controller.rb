class SessionsController < ApplicationController
  #skip_before_action :check_login, :check_form

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id

      # TODO: You're logged in; a session has been created
      redirect_to root_path
    else
      # TODO: Display an error page!
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
