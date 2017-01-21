class User < ActiveRecord::Base
  validates :name, :twitter_id, presence: true
  validates :twitter_id, uniqueness: true


  scope :published, -> { where(published: true)   }
  scope :unpublished, -> { where(published: false)   }
end
