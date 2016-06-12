class Client < ActiveRecord::Base
  def from_omniauth(auth)
      self.provider = auth.provider
      self.uid = auth.uid
      self.name = auth.info.name
      self.oauth_token = auth.credentials.token
      self.oauth_expires_at = Time.at(auth.credentials.expires_at)
      self.save!
  end
end
