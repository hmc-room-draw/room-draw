class AdminpageController < ApplicationController


  def reminder()
  end

  # Function called when the user clicks the "Send Email" button on the admin
  # reminder page.
  # The button will redirect admin to a email-customization page
  # MVP: emails all students who have not yet participated in room draw.
  def clicked()

    # NOTE: The current un-commented code sends an email to all instances of the
    # temporary "User" model.
    # This function works and can be used to verify that mailing works.


    # TODO: redirect to new email page, to be tested 

    # redirect 'emails/new'

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

  def upload()
    @users = User.all
  end

end
