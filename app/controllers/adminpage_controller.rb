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


  def download_users()
    '''
    Download all users with attributes of name and email in
    the format of csv.
    '''

    # The attributes should be first name and last name
    # But the implementation is different from the UML
    user_csv = CSV.generate do |csv|
      csv << ["Name", "Email"]
      User.all.each do |user|
        csv << [user.name, user.email]
      end
    end
    send_data user_csv,
      :type => 'text/csv',
      :filename => 'users.csv',
      :disposition => 'attachment'
  end

  def download_placements()
    '''
    Download all placements
    '''
    user_csv = CSV.generate do |csv|
      csv << ["Pull ID", "First", "Last", "Room ID"]
      # Pull.all.each do |pull|
      #   # Use user_id to trace the first name, last name and email of user_id
      #   # uncomment and test this block when database code is ready
      #   #student = Student.find_by(student_id: pull.student_id)
      #   #user = User.find_by(user_id: student.user_id)
      #   #room = RoomAssignment.find_by(student_id:pull.student_id)
      #   #csv << [user.first_name, user.last_name,
      #   # student.class_rank,user.email, room.room_id]
      # end
    end
    send_data user_csv,
      :type => 'text/csv',
      :filename => 'pulls.csv',
      :disposition => 'attachment'
  end

  def download_non_participants()
    '''
    Download all students who have not participated in room draw
    '''
    user_csv = CSV.generate do |csv|
      csv << ["User_Id", "Class"]
      Student.all.each do |student|
        if student.has_participated == false
          # Use user_id to trace the first name, last name and email of user_id
          # uncomment and test this block when database code is ready
          #user = User.find_by(user_id: student.user_id)
          #csv << [user.first_name, user.last_name, student.class_rank,user.email]
          csv << [student.user_id, user.class_rank]
        end
      end
    end
    send_data user_csv,
      :type => 'text/csv',
      :filename => 'non_participants.csv',
      :disposition => 'attachment'
  end

end
