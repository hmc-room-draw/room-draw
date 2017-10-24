class Contact < MailForm::Base
  append :remote_ip, :user_agent
  attribute :message
  validates :message,   length: { in: 15..2000 }
  attribute :subject,   validate: true

  def headers
    {
      subject: %(<#{subject}>),
      to: 'roomdrawtest@gmail.com',
      from: 'roomdrawtest@gmail.com'
    }
  end
end