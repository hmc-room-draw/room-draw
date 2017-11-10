class SessionsController < ApplicationController
  skip_before_action :check_login, :check_form

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      redirect_to dorms_path
    else
      flash[:alert] = "No account exists with the given email."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
