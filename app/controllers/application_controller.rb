require './lib/google_api/drive.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_draw_period

  # TODO: Uncomment the line below to enable form/login redirect and comingsoon
  # redirect when draw period isn't live. Make sure also to uncomment the 
  # corresponding line in `app/controllers/sessions_controller.rb`!
  before_action :check_login, :check_form, :check_draw_period

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def current_draw_period
    @current_draw_period ||= DrawPeriod.find_by('start_datetime < ? AND ? < end_datetime', DateTime.now, DateTime.now)
  end

  def check_login
    if not current_user
      flash[:alert] =  'Please log in.'
      redirect_to login_path
    end
  end

  def check_form
    @current_student = current_user.student
    unless @current_student == nil || @current_student.has_completed_form then
      ss_key = Rails.application.config.responses_spreadsheet_key
      if email_in_spreadsheet?(ss_key, current_user.email) then
        @current_student.has_completed_form = true
        @current_student.save!
      else
        if current_user.is_admin
          flash[:alert] = 'Don\'t forget to fill out the form!'
        else
          redirect_to Rails.application.config.form_url
        end
      end
    end
  end

  def check_draw_period
    unless current_draw_period != nil then
      unless current_user.is_admin then
        redirect_to coming_soon_path
      end
    end
  end

  private
    def email_in_spreadsheet?(key, email)
      ss = GoogleDriveApi.read_spreadsheet(key)
      ws = ss.worksheets.first
      replies = ws.rows.drop(1)
      replies.any? {|row| row.last == email}
    end
end
