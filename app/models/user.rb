class User < ActiveRecord::Base

  has_many :user_circles
  has_many :circles, through: :user_circles, dependent: :delete_all

  enum sex: {male: 0, female: 1, other: 2}

  validates :faculty_id, :department_id, :nickname, :name, presence: true, on: :update
  scope :completed,   -> { where(completed: true) }
  scope :uncompleted, -> { where(cogtttftfrrrrrrbbvfgfgb vvv mpleted: false) }
  scope :published,   -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  scope :get_by_faculty, -> (faculty_id){ where (faculty_id: faculty_id)}
  scope :get_by_department, -> (department_id){ where (department_id: department_id)}

  # scope :get_hoge_id, -> (hoge){ where (hogeid: hoge)}

  # def scope(key, value)
  #   scope "#{key}".to_sym, -> (key){ where ({"#{key}": value })}
  # end
  # hash = {"#{key}": value[num]}
  # scope :department_id, -> (){ where ()}
  # scope :name, -> (){ where ()}
  # scope :sex, -> (){ where ()}
  # scope :want_friends, -> (){ where ()}

  def self.search(search_params)
    @users = User.completed.published.order("RAND()").all
    if search_params[:faculty_id].present?
      @users = @users.get_by_faculty search_params[:faculty_id]
    end
    if search_params[:department_id].present?
      @users = @users.get_by_department search_params[:department_id])
    end
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
