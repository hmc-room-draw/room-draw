# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 25,
    :authentication => :plain,
    :user_name => "roomdrawtest@gmail.com",
    :password => "roomdrawtest2017"
  }
end
