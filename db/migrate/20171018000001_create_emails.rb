class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.text :description

      t.timestamps
    end
  end
end
