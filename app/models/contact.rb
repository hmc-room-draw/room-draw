class Contact < MailForm::Base
  append :remote_ip, :user_agent
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  validates :message,   length: { in: 15..2000 }
  attribute :subject,   validate: true

  def headers
    {
      subject: %(<#{subject}>),
      to: %("#{name}" <#{email}>),
      from: 'roomdrawtest@gmail.com'
    }
  end
end