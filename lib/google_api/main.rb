require 'googleauth'
require 'googleauth/stores/file_token_store'

class GoogleApi
  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  CLIENT_SECRETS_PATH = 'client_secret.json'
  CREDENTIALS_PATH = File.join(Dir.home, '.credentials', 'hmc-room-draw.yaml')

  def self.client_id
    @client_id ||= Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  end

  def self.authorize(scope)
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))
    token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(@client_id, scope, token_store)

    user_id = 'default'
    authorizer.get_credentials(user_id)
  end
end
