class AddSendDateToEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :sendDate, :Date
  end
end
