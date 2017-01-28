class User < ActiveRecord::Base
  validates :faculty_id, :department_id, :nickname, :name, presence: true, on: :update
  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }
  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }


  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    nickname = auth[:info][:nickname]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
    end
  end

end
