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


  #Src: http://imnithin.in/asynchronously_synchronous.html
  #https://apidock.com/rails/ActionController/Streaming/send_data
  
# NOTE: This is solely used to test the csv-downloading functionality
# We probably don't need this function in the actual app, and if we do,
# then we'd have to replace users with students, and replace user.name with
# user.first_namd and user.last_name
  def download_users()
    user_csv = CSV.generate do |csv|
      csv << ["Name", "Email"] #Header
      User.all.each do |user|
        csv << [user.name, user.email]
      end
    end
    send_data user_csv,
      :type => 'text/csv',
      :filename => 'users.csv',
      :disposition => 'attachment'
  end

# NOTE: Untested - should be tested once DB is implemented.
# Downloads a list of the final placements of all students.
  def download_final_placements()
    placements_csv = CSV.generate do |csv|
      csv << ["First", "Last", "Class", "Number", "Dorm", "Room"]
      Student.all.each do |student|
        if student.room
          user = student.user
          room = student.room
          dorm = student.room.dorm.name #TODO - check if dorm name is being stored
          csv << [user.first_name, 
                  user.last_name, 
                  student.class, 
                  student.room_draw_number,
                  dorm,
                  room.room_num]
        end
      end
    end
    send_data placements_csv,
      :type => 'text/csv',
      :filename => 'placements.csv',
      :disposition => 'attachment'
  end

  # Download a list of everyone who didn't participate in room draw.
  def download_non_participants()
    non_participants_csv = CSV.generate do |csv|
      csv << ["First", "Last", "ID", "Class", "Number", "Email"]
      Student.where(has_participated: false).find_each do |student|
        user = Student.user
        csv << [user.first_name, 
                user.last_name, 
                student.id, 
                student.class, 
                student.room_draw_number, 
                user.email]
      end
    end
    send_data non_participants_csv,
      :type => 'text/csv',
      :filename => 'non_participants.csv',
      :disposition => 'attachment'
  end
 
end
