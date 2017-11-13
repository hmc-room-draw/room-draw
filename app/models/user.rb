class User < ApplicationRecord
  has_one :student, dependent: :destroy
  require 'CSV'

  # Name and email must be non-nil
  validates :first_name, presence: true
  validates :last_name, presence: true

  accepts_nested_attributes_for :student

  # Email must be a valid email address
  # This regex is not technically email-compliant but is right in 99% of cases
  # From https://www.railstutorial.org/book/modeling_users
  validates :email, presence: true, 
    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    
  before_save { self.email = email.downcase  }

  def self.from_omniauth(auth)
    where(email: auth.info.email).take do |user|
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  # Import users from a csv file
  # Checks to see if the user exists in the database (compares email). If the user exists,
  # it will attempt to update the user. If not, it will create a new user.
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      user_hash = row.to_hash

      user = User.where(email: user_hash["email"])

      if user.count == 1
        user.first.update_attributes(user_hash)
      else
        User.create!(user_hash)
      end # end if !user.nil?

    end # end CSV.foreach
  end # end self.import(file)

end
