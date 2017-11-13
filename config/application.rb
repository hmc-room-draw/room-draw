require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Load env vars from .env
Dotenv::Railtie.load

module RoomDraw
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # set up delayed_job adapter
    #config.active_job.queue_adapter = :delayed_job
    
    # Set time zone to PT
    config.active_record.default_timezone = 'Central Time (US & Canada)'
    config.time_zone = 'Pacific Time (US & Canada)'
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
