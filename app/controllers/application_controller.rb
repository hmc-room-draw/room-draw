class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  helper_method :current_user

  # TODO: Uncomment these to enable form/login redirect
  #before_action :check_login, :check_form

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def check_login
    if not current_user
      flash[:alert] =  'Please log in.'
      redirect_to login_path
    end
  end

  def check_form
    unless current_user.has_completed_form then
      redirect_to Rails.application.config.form_url
    end
  end

  def check_form_skip_admin
    unless current_user.is_admin then
      check_form
    end
  end
end
