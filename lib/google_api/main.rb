require 'googleauth'
require 'googleauth/stores/file_token_store'

class GoogleApi
  CLIENT_SECRETS_PATH = 'secrets/client.json'

  def self.client_id
    @client_id ||= Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  end
end
