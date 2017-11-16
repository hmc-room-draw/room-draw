class GeneralMailer < ApplicationMailer

  def reminder_email(subject, content)
    #@user = user
    mail(to: 'jizhu@g.hmc.edu', subject: subject, body: content)
    # mail(to: user.email, subject: subject, body: content)
  end

end
