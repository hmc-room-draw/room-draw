class AddSendToNeverLoggedInToEmails < ActiveRecord::Migration[5.1]
  # Adds booleans to specify which student statues (or admins) should recieve an email.
  def change
    add_column :emails, :send_to_never_logged_in, :boolean
    add_column :emails, :send_to_never_pulled_room, :boolean
    add_column :emails, :send_to_ready_to_pull, :boolean
    add_column :emails, :send_to_in_room, :boolean
    add_column :emails, :send_to_admins, :boolean
  end
end
