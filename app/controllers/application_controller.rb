require './lib/google_api/drive.rb'

# Wrapper class for the user object - used for Pundit authentication.
class UserContext
  attr_reader :user, :in_draw_period

  def initialize(user, in_draw_period)
    @user = user
    @in_draw_period = in_draw_period
  end
end

class ApplicationController < ActionController::Base
  include Pundit
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :check_login
  helper_method :current_user, :current_draw_period

  def pundit_user
    UserContext.new(current_user, current_draw_period)
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def current_draw_period
    candidate = DrawPeriod.first
    if candidate == nil
      @current_draw_period = nil
    elsif candidate.start_datetime < DateTime.now && candidate.end_datetime > DateTime.now
      @current_draw_period = candidate
    else
      @current_draw_period = nil
    end
  end

  def check_login
    if not current_user
      flash[:alert] =  'Please log in.'
      redirect_to login_path
    end
  end
=begin
  def check_form
    if current_user  
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
  end

  private
    def email_in_spreadsheet?(key, email)
      ss = GoogleDriveApi.read_spreadsheet(key)
      ws = ss.worksheets.first
      email_idx = ws.rows.first.index("Email Address")
      replies = ws.rows.drop(1)
      replies.any? {|row| row[email_idx] == email}
    end
end
=end
end
