class SessionsController < ApplicationController
  #skip_before_action :check_login, :check_form
  def new
    if current_user
      if current_user.is_admin
        redirect_to admin_home_path
      else
        redirect_to students_home_path
      end
    end
  end

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      if user.is_admin
        redirect_to admin_home_path
      else
        redirect_to student_home_path
      end
    else
      flash[:alert] = "No account exists with the given email."
      redirect_to student_home_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
