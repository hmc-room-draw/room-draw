class GeneralMailer < ApplicationMailer

  def reminder_email(user, subject, content)
    @user = user
    mail(to: "jizhu@g.hmc.edu", subject: subject, body: content)
  end

end