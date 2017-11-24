class SessionsController < ApplicationController
  #skip_before_action :check_login, :check_form

  def create
      user = User.from_omniauth(request.env['omniauth.auth'])
      if user
          session[:user_id] = user.id
          if user.is_admin
              redirect_to admin_home_path
          else
              redirect_to dorms_path
          end
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
