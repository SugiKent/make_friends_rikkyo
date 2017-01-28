class User < ActiveRecord::Base
  def self.find_or_create_from_auth(auth)
  provider = auth[:provider]
  uid = auth[:uid]
  nickname = auth[:info][:nickname]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
    end
  end
end
