class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def index
  end

  def show
  end

  def create
    # fetch created email
    email = params["email"]

    # convert information in datetime_select form to Ruby date:
    # https://stackoverflow.com/questions/5073756/where-is-the-
    # rails-method-that-converts-data-from-datetime-select-into-a-datet

    # extract send datetime
    send_date = Date.new(email["created_at(1i)"].to_i,
                        email["created_at(2i)"].to_i,
                        email["created_at(3i)"].to_i)
    # extract subject of the email
    subject = email["subject"]

    # extract content of the email
    content = email["description"]

    @email = Email.new(subject: subject, description: content, sendDate: send_date)
    @email.save

    # Run bin/delayed_job start to process all jobs
    GeneralMailer.reminder_email_to_non_participants(subject, content, send_date)
  end

  def destroy
  end

end
