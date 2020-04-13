require './lib/google_api/drive.rb'

form_url = ENV['FORM_URL']
Rails.application.config.form_url = form_url

responses_url = ENV['https://docs.google.com/spreadsheets/d/1bd1jrm5RnHofCnjiJNoEhK4Ea3OITIt8u6jzYWB9_UI/edit#gid=1772063954']

# Extracts the document key from a form URL formatted like:
# https://docs.google.com/spreadsheets/d/1i0lcWJqCu9Jk6VPb3xvrJnNkMtw__hne9WrN6O8gDq4/
KEY_REGEX = /.+\/d\/(.+)\/.*/

match = KEY_REGEX.match(responses_url)
raise "Malformed response spreadsheet URL `#{responses_url}`. Expected format https://docs.google.com/spreadsheets/d/<KEY>/..." unless match

key = match[1]
Rails.application.config.responses_spreadsheet_key = key

begin
   GoogleDriveApi.read_spreadsheet(key)
 rescue
   email = GoogleDriveApi.service_account_email
   raise "Failed to access form with key `#{key}`. Please ensure the form is shared with `#{email}`."
 end

