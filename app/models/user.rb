class User < ActiveRecord::Base

  has_many :user_circles
  has_many :circles, through: :user_circles, dependent: :delete_all

  enum sex: {male: 0, female: 1, other: 2}

  validates :faculty_id, :department_id, :nickname, :name, presence: true, on: :update
  scope :completed,   -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }
  scope :published,   -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  #性別カラムの検索
  def self.get_by_sex(a_value)
    send(a_value.intern)
  end

  def self.get_by_id(a_hash)
    where(a_hash)
  end

  def self.search(params, users)
      params.each do |key, value|
        if value.present?
          hash = {"#{key}": value}
          users = users.get_by_id(hash) if key == "faculty_id" || "department_id"
          # users = users.get_by_sex(value) if key == "sex"
        end
      end
    return users
  end

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    nickname = auth[:info][:nickname]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
    end
  end

  class << self
    def localed_statuses
      sexes.keys.map do |s|
        [ApplicationController.helpers.t("user.sex.#{s}"), s]
      end
    end
  end

end
