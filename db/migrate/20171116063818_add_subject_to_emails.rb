class AddSubjectToEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :subject, :string
  end
end
