class GeneralMailer < ApplicationMailer
  def self.reminder_email_to_non_participants(sendDate, emailId)
    diffD = (sendDate - Date.today).to_i
    GeneralMailer.delay(queue:"reminder", run_at: diffD.days.from_now).scheduled_email("nonparticipants", emailId)
  end

  def self.reminder_email(user, subject, content)
    @user = user
    mail(to: user.email, subject: subject, body: content)
  end

  def scheduled_email(category, emailId)
    email = Email.find emailId
    if email
      Student.all.each do |student|
        if category == "nonparticipants" and not student.has_participated
          mail(to: student.user.email, subject: email.subject, body: email.description)
        end
      end
    end
  end

end
