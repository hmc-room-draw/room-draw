# README

## Google OAuth login

This app uses Google OAuth for login. You need secret keys in JSON format for
the Google Apps API as well as our Google Service Account, both of which I have
posted on Slack. The app expects them to appear as `secrets/client.json` and
`secrets/service_account.json` respectively. Thee can also be obtained via the
Google Developer Console, although the service account key must be regenerated;
the extant one cannot be redownloaded.

`.env` is now free of private data, but I have left it in the `.gitignore`
in case anyone still has keys in it.

-- Spencer

## A note on logging in

Users will only be allowed to login if a user with a corresponding email already
exists. Right now **you will need to manually create a user with your own email**
via `rails console`; enter `User.create :first_name => "First", :last_name => "Last",
:email => "your_email@g.hmc.edu", :is_admin => true`.
This will let you access `/users/new` and create other users.

-- Spencer

## Form integration

This app now supports redirection to Google Forms, and can check the associated
spreadsheet to see if a user has replied. Some coordination is necessary
between Google Docs and this app, which requires the following setup.

### Acquiring credentials

Download `secrets.zip` from Slack for now.

TODO(Spencer): Write up how to get creds from Google Developer Console later.

### Configuration

1. In your Google form settings, make sure that `Collect email addresses` is
   enabled under `Settings -> General`.
2. Optionally (and highly recommended), under `Settings -> Presentation`, set
   the `Confirmation message` to include a link to the HMC room draw site.
   Google Forms cannot automatically redirect back to our site.
3. Under the `Responses` tab, click the Google Sheets button (green square with
   white cross) to create an associated Google Sheets spreadsheet.
4. Share the spreadsheet with whatever `client_email` is specified by the
   service account key information.
5. In `.env`, set `FORM_URL` to the URL of the form and `RESPONSES_URL` to the
  URL of the sheet.

-- Spencer
