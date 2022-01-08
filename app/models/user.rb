class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
     user.name = auth.info.name
     user.email = auth.info.email
     user.google_refresh_token = auth.credentials.refresh_token if auth.credentials.refresh_token.present?
    end
  end
end
