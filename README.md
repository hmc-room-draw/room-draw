
# README

# Project Name and Description
Harvey Mudd Room Draw

Every year, Harvey Mudd College students select rooms for the following year through a process called room draw.  The first stage is "digital draw," during which students indicate online which rooms they intend to select during the actual draw. Last year, digital draw was done using a Google Sheet. Our app improves digital draw by allowing students to quickly see on a dorm map which rooms are available and to choose where they intend to live.

## Architecture
![screen shot 2017-12-07 at 3 58 53 pm](https://user-images.githubusercontent.com/19757585/33744729-92c222de-db67-11e7-8b00-452a7f8e6e74.png)


### Prerequisites

1. Install git.
2. Install Ruby version 2.4.2 and Rails version 5.1.4.

### Gems

* [`delayed_job`](https://github.com/collectiveidea/delayed_job): It runs queued tasks in the backend. It is used for scheduling admin emails. 
* [`rails_bootstrap_sortable`](https://github.com/DuroSoft/rails_bootstrap_sortable): The bootstrap_sortable plugin, packaged for ruby on rails.

## Installation

TODO: Describe the installation process.
Instructions need to be such that a user can just copy/paste the commands to get things set up and running.

1. Clone this repository: `git clone https://github.com/hmc-room-draw/room-draw.git`
2. Run `bundle install`.
3. Run `rails db:reset db:seed` to setup the database.
4. If you want to send scheduled emails, run `bin/delayed_job start`.
5. Run `rails s` to start the server.
6. Navigate to `localhost:3000.`

# Google OAuth login

This app uses Google OAuth for login. You need secret keys in JSON format for
the Google Apps API as well as our Google Service Account, both of which I have
posted on Slack. The app expects them to appear as `secrets/client.json` and
`secrets/service_account.json` respectively. Thee can also be obtained via the
Google Developer Console, although the service account key must be regenerated;
the extant one cannot be redownloaded.

`.env` is now free of private data, but I have left it in the `.gitignore`
in case anyone still has keys in it.


## A note on logging in

Users will only be allowed to login if a user with a corresponding email already
exists. Right now **you will need to manually create a user with your own email**
via `rails console`; enter `User.create :first_name => "First", :last_name => "Last",
:email => "your_email@g.hmc.edu", :is_admin => true`.
This will let you access `/users/new` and create other users.

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

## Sending scheduled emails

Run `bin/delayed_job start` if you want the ability to send scheduled emails.  Run `bin/delayed_job stop` afterwards to stop it.  If emails are not sending, you can enter `Delayed::Job.all` into the rails console to see emails in the queue.

## Functionality

### Student functionality
### Admin functionality

## Known Problems

TODO: Describe any known issues, bugs, odd behaviors or code smells. Provide steps to reproduce the problem / name a file or a function where the problem lives.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D




