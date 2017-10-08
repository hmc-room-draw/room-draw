class GeneralMailer < ApplicationMailer

  def reminder_email(user)
    @user = user
    mail(to: @user.email, subject: "It's your last chance!")
  end

end
