class GeneralMailer < ApplicationMailer
  def self.reminder_email_to_non_participants(sendDate, emailId)
    diffD = (sendDate - Date.today).to_i
    GeneralMailer.delay(queue:"reminder", run_at: diffD.days.from_now).scheduled_email(emailId)
  end

  def self.reminder_email(user, subject, content)
    @user = user
    mail(to: user.email, subject: subject, body: content)
  end

  def scheduled_email(emailId)
    #mail(to: 'owatkins@hmc.edu', subject: "GOT TO THE FUNCTION!", body: "NOTHING INTERESTING.")
    email = Email.find emailId
    if email
      # Student.all.each do |student|
      #   send_mail = false
      #   case student.status
      #   when :never_logged_in
      #     if email.send_to_never_logged_in
      #       send_mail = true
      #     end
      #   when :never_pulled_room
      #     if email.send_to_never_pulled_room
      #       send_mail = true
      #     end
      #   when :formerly_in_room
      #     if email.send_to_formerly_in_room
      #       send_mail = true
      #     end
      #   when :in_room
      #     if email.send_to_in_room
      #       send_mail = true
      #     end
      #   else
      #     send_mail = false
      #   end 

      #   if send_mail
      #     mail(to: 'oliviagracewatkins@gmail.com', subject: student.user.first_name + student.user.last_name, body: email.description)
      #     #mail(to: student.user.email, subject: email.subject, body: email.description)
      #   end
      # end
      if email.send_to_admins
        User.all.each do |user|
          if user.is_admin
            #mail(to: 'oliviagracewatkins@gmail.com', subject: user.first_name + user.last_name, body: email.description)
            mail(to: user.email, subject: email.subject, body: email.description)
          end
        end 
      end
      email.update(sent_status: true)
      #mail(to: 'owatkins@g.hmc.edu', subject: "UPDATED!", body: email.sent_status ? "SENT" : "UNSENT")
    end
  end

end
