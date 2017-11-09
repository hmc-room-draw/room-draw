class Contact < MailForm::Base
  append :remote_ip, :user_agent
  attribute :message
  validates :message,   length: { in: 15..2000 }
  attribute :subject,   validate: true
  attr_accessor :footer
  attr_accessor :Students_not_logged_in, :Students_in_room, :Students_ready_to_pull

  def headers
    {
      subject: %(<#{subject}>),
      to: 'roomdrawtest@gmail.com',
      from: 'roomdrawtest@gmail.com'
    }
  end
end