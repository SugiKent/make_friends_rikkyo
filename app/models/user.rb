class User < ActiveRecord::Base

  has_many :user_circles
  has_many :circles, through: :user_circles, dependent: :delete_all

  enum sex: {male: 0, female: 1, other: 2}

  validates :faculty_id, :department_id, :nickname, :name, presence: true, on: :update
  scope :completed,   -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }
  scope :published,   -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  def self.get_by_faculty(faculty_id)
    where(faculty_id: faculty_id)
  end

  def self.get_by_department(department_id)
    where(department_id: department_id)
  end

  def self.search(params)
    @users = User.completed.published.order("RAND()").all
    if params != nil
      if params[:faculty_id].present?
        @users = @users.get_by_faculty(params[:faculty_id])
      end
      if params[:department_id].present?
        @users = @users.get_by_department(params[:department_id])
      end
    end
    return @users
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
