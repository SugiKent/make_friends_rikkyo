class Topic < ActiveRecord::Base
  validates :title, :description, presence: true
  belongs_to :user
  has_many :posts

  scope :without_department, -> { where.not(belong_type: "department") }
end
