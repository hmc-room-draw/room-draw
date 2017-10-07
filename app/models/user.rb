class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(email: auth.info.email).take do |user|
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
