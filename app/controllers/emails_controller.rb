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

    # delayed job

    diffM = (send_date-DateTime.now)
    puts DateTime.now, send_date
    hours=send_date.minus_with_duration(DateTime.now)
    puts hours
    user = User.all.first
    puts user
    Student.all.each do |student|
      if student.has_participated == false
        puts student.class_rank
        message = GeneralMailer.reminder_email(user, subject, content)
        puts message
        message.deliver_now
        if student.user
          user = student.user
          puts user
        end 
      end
    end
    # User.all.each do |user|
    #   GeneralMailer.reminder_email(user).deliver_later
    # end
    # # send at scheduled date time by admin
    # User.all.each do |user|
    #   GeneralMailer.delay(queue:"reminder", run_at: 10.minutes.from_now).reminder_email(user)
    # end
  end

  def destory
  end
end
