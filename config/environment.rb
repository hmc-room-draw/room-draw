# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


# How to configure smtp of active mailer 
#https://stackoverflow.com/questions/25872389/
#rails-4-how-to-correctly-configure-smtp-settings-gmail
Rails.application.configure do
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :authentication => :plain,
    :user_name => "hmcroomdraw2018@gmail.com",
    :password => "hmcroomdraw"
  }
end
