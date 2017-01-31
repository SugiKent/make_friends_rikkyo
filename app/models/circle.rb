class Circle < ActiveRecord::Base

  has_many :user_circles
  has_many :user, through: :user_circles

  validates :name, :category, presence: true
  validates :name, uniqueness: true
  enum category: { sport: 0, culture: 1, other: 2 }
end
