require 'google/apis/sheets_v4'
require './lib/google_api/main.rb'

class GoogleSheetsApi
  APPLICATION_NAME = 'HMC Room Draw'
  SCOPE = {
    :readonly => Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY
  }

  def self.service
    @service ||= Google::Apis::SheetsV4::SheetsService.new do |service|
      service.client_options.application_name = APPLICATION_NAME
      service.authorization = lambda { || GoogleApi.authorize(SCOPE[:readonly]) }
    end
  end

  def self.read_sheet(id, from, to)
    range = 'Class Data!#{from}:#{to}'
    service.get_spreadsheet_values(id, range)
  end
end
