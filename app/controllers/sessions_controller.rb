class SessionsController < ApplicationController
  skip_before_action :check_login, :check_form, :check_draw_period

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = "No account exists with the given email."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
