class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
  	# add an index on the email column of the users table
  	# The index by itself doesn’t enforce (email) uniqueness, 
  	# but the option unique: true does
  	add_index :users, :email, unique: true
  end
end
