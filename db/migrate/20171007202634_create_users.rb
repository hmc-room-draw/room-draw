class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :is_admin
      t.boolean :has_completed_form
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
