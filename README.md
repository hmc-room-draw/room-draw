# README

## Google OAuth login

This app uses Google OAuth for login. You need a secret key for the Google Apps
API, which the app will load automatically from a file named `.env` in the root
directory. We can't commit the keys to GitHub. I sent out the contents of
`.env` on the Slack `#general` channel. You can create that file in the root
dir and forget about it; I put it in `.gitignore` so it won't be committed.

## A note on logging in

Users will only be allowed to login if a user with a corresponding email already
exists. Right now **you will need to manually create a user with your own email**
via `rails console`; enter `User.create :first_name => "First", :last_name => "Last",
:email => "your_email@g.hmc.edu", :is_admin => true`.  This will let you access
`/users/new` and create other users.

-- Spencer
