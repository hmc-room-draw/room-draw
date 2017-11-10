require './lib/google_api/drive.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  # TODO: Uncomment the line below to enable form/login redirect. Make sure also
  # to uncomment the corresponding line in `app/controllers/sessions_controller.rb`!
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
    puts "HELLO"
    unless current_user.has_completed_form then
      puts "hi"
      ss_key = Rails.application.config.responses_spreadsheet_key
      if email_in_spreadsheet(ss_key, current_user.email) then
        current_user.has_completed_form = true
        current_user.save!
      else
        redirect_to Rails.application.config.form_url
      end
    end
  end

  def check_form_skip_admin
    unless current_user.is_admin then
      check_form
    end
  end

  private
    def email_in_spreadsheet(key, email)
      ss = GoogleDriveApi.read_spreadsheet(key)
      ws = ss.worksheets.first
      replies = ws.rows.drop(1)
      replies.any? {|row| row.last == email}
    end
end
