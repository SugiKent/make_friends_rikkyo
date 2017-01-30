class Circle < ActiveRecord::Base

  validates :name, :category, presence: true
  validates :name, uniqueness: true
  enum category: { sport: 0, culture: 1 }
end
