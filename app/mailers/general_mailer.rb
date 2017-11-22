class GeneralMailer < ApplicationMailer
  def reminder_email_to_non_participants(subject, content, sendDate)
    diffD = (sendDate - Date.today).to_i

    Student.all.each do |student|
      if student.has_participated == false and student.user
          user = student.user
          GeneralMailer.delay(queue:"reminder", run_at: diffD.days.from_now).reminder_email(user, subject, content)
      end
    end
  end

  def reminder_email(user, subject, content)
    @user = user
    mail(to: user.email, subject: subject, body: content)
  end

end
