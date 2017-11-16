class GeneralMailer < ApplicationMailer

  def reminder_email(user, subject, content)
    @user = user
    mail(to: user.email, subject: subject, body: content)
  end

end
