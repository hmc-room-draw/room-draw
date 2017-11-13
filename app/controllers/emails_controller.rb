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

    #puts email["created_at(2i)"]

    send_date = DateTime.new(email["created_at(1i)"].to_i,
                        email["created_at(2i)"].to_i,
                        email["created_at(3i)"].to_i,
                        email["created_at(4i)"].to_i,
                        email["created_at(5i)"].to_i)
    subject = email["subject"]
    content = email["description"]


    # Run bin/delayed_job start to process all jobs

    diffM = (send_date-DateTime.now)
    hours=send_date.minus_with_duration(DateTime.now)
    user = User.all.first
    Student.all.each do |student|
      if student.has_participated == false
        message = GeneralMailer.reminder_email(user, subject, content)
        message.deliver_now
        if student.user
          user = student.user
        end 
      end
    end
  end

  def destory
  end
end
