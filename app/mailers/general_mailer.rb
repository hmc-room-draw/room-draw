class GeneralMailer < ApplicationMailer
  def self.reminder_email_to_non_participants(sendDate, emailId)
    puts "YAYY!!!!!!!!!!!!!"
    diffD = (sendDate - Date.today).to_i
    # TODO - would probably be more extensible to make this an arbitrary query
    puts "SENDING REMINDER AT", diffD.days.from_now, "YEAH", emailId
    GeneralMailer.delay(queue:"reminder", run_at: diffD.days.from_now).scheduled_email("nonparticipants", emailId)
    #GeneralMailer.delay(queue:"reminder", run_at: diffD.days.from_now).reminder_email(user, subject, content)
  end

  def self.reminder_email()
    @user = user
    mail(to: user.email, subject: subject, body: content)
  end

  def self.scheduled_email(category, emailId)
    puts "SCHEDULED EMAIL FUNC"
    email = Email.find emailId
    Student.all.each do |student|
      if category == "nonparticipants" and not student.has_participated
        puts "SENDING EMAIL TO", student.user.email, "WITH CONTENT", email.subject, email.content
        mail(to: student.user.email, subject: email.subject, body: email.content)
      end
    end
  end

end
