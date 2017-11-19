class EmailApi
  def sendToNonParticipants(email)
    # Calculate delayed time
    diffD = (email.sendDate - Date.today).to_i

    #user = User.all.first
    Student.all.each do |student|
      if student.has_participated == false and student.user
          user = student.user
          GeneralMailer.delay(queue:"reminder", run_at: diffD.days.from_now).reminder_email(user, subject, content)
        end
      end
    end
  end
end
