class User < ActiveRecord::Base
  validates :name, :twitter_id, :faculty_id, :department_id, presence: true
  validates :twitter_id, uniqueness: true

  scope :published, -> { where(published: true)   }
end
