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

    # Calculate delayed time
    diffD = (send_date-Date.today).to_i
    #user = User.all.first
    Student.all.each do |student|
      if student.has_participated == false
        #GeneralMailer.delay(queue:"reminder", run_at: diffD.days.from_now).reminder_email(subject, content)
        if student.user
          user = student.user
          #puts user.email
          #GeneralMailer.reminder_email(user, subject, content).deliver_now
          GeneralMailer.delay(queue:"reminder", run_at: diffD.days.from_now).reminder_email(user, subject, content)
        end
      end
    end
  end

  def destory
  end

end
