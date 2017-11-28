class AddSentStatusToEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :sent_status, :boolean
  end
end
