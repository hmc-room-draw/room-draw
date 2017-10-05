class AdminpageController < ApplicationController
  def reminder()
  end

  def clicked()
    User.all.each do |user|
      GeneralMailer.reminder_email(user).deliver_later
    end
  end
end
