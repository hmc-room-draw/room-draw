require './lib/google_api/main.rb'

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  client_id = GoogleApi.client_id
  provider :google_oauth2, client_id.id, client_id.secret
end
