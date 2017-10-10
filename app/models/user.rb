class User < ApplicationRecord
	# Ensures that email addresses are saved in all lowercase in the database
	# Self refers to the current user
	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
	# A regular expression that essentially makes sure the email is 
	# of the form <string>@<string>.<string>
    validates :name, presence: true, length: { maximum: 50 }
    # A name starting with a capital letter is a constant in Ruby
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX },
                    # ensures that each user has a unique email (ignoring case)
                    # careful though, this only ensures uniqueness at the model level,
                    # NOT the database level
                    uniqueness: { case_sensitive: false }
end
