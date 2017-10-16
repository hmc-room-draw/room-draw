class User < ApplicationRecord
  # Name and email must be non-nil
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Email must be a valid email address
  # This regex is not technically email-compliant but is right in 99% of cases
  # From https://www.railstutorial.org/book/modeling_users
  validates :email, presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    #uniqueness: { case_sensitive: false }
  before_save { self.email = email.downcase  }

  has_one :student

  def self.from_omniauth(auth)
    where(email: auth.info.email).take do |user|
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.search(search)
    where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end

end
