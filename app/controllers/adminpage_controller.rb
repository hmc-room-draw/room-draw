class AdminpageController < ApplicationController

  
  def reminder()
  end

  # Function called when the user clicks the "Send Reminder Email" button on
  # the /adminpage/reminder page.
  # It emails all students who have not yet participated in room draw.
  def clicked()
    # TODO: Make this function called automatically on a schedule.


    # NOTE: The current un-commented code sends an email to all instances of the
    # temporary "User" model.
    # This function works and can be used to verify that mailing works.
    User.all.each do |user|
      GeneralMailer.reminder_email(user).deliver_later
    end

    # Run at scheduled time
    puts "NOOOO"
    date = params
    puts date
    User.all.each do |user|
      GeneralMailer.delay(queue:"reminder", run_at: 3.minutes.from_now).reminder_email(user)
    end

    # TODO: Once the DB models have been implemented, uncomment the code below
    # and remove the code above.
    # Also, in reminder.html.erb and reminder.txt.erb remember to replace
    # @user.name with @user.first_name and @user.last_name.
    # Student.all.each do |student|
    #   if student.has_participated == false
    #     user = student.user
    #     GeneralMailer.reminder_email(user).deliver_later
    #   end
    # end

  end
end
