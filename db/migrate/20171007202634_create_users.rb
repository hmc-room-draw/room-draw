class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.has_one: student, index: true

      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :is_ashmc_admin
      t.boolean :is_super_admin
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
