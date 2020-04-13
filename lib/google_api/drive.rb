require 'google_drive'
require 'json'

class GoogleDriveApi
  SECRET_PATH = 'secrets/service_account.json'

  def self.session
    @session ||= GoogleDrive::Session.from_service_account_key(SECRET_PATH)
  end
=begin
  def self.read_spreadsheet(key)
    self.session.spreadsheet_by_key(key)
  end
=end
  def self.service_account_email
    @service_account_email ||= File.open(SECRET_PATH) do |f|
      secrets = JSON.parse(f.read())
      secrets['client_email']
    end
  end
end
