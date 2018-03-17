class GeneralMailer < ApplicationMailer
  def self.schedule_reminder_email(sendDate, emailId)
    diffD = (sendDate - Date.today).to_i
   # self.delay(queue:"reminder", run_at: diffD.days.from_now).scheduled_email(emailId)
   self.scheduled_email(emailId) 
  end

  def self.send_email(user, subject, content)
    @user = user
    ActionMailer::Base.mail(to: user.email, from: 'from@example.com', subject: subject, body: content).deliver
  end

  def self.scheduled_email(emailId)
    email = Email.find emailId
    if email
      Student.all.each do |student|
        send_mail = false
        case student.status
        when :never_logged_in
          if email.send_to_never_logged_in
            send_mail = true
          end
        when :never_pulled_room
          if email.send_to_never_pulled_room
            send_mail = true
          end
        when :formerly_in_room
          if email.send_to_formerly_in_room
            send_mail = true
          end
        when :in_room
          if email.send_to_in_room
            send_mail = true
          end
        else
          send_mail = false
        end 

        if send_mail
          ActionMailer::Base.mail(to: student.user.email, from: 'from@example.com', subject: email.subject, body: email.description).deliver
        end
      end
      if email.send_to_admins
        User.all.each do |user|
          if user.is_admin
            ActionMailer::Base.mail(to: user.email, from: 'from@example.com', subject: email.subject, body: email.description).deliver
          end
        end 
      end
      email.update(sent_status: true)
    end
  end

end
