class Faculty < ActiveRecord::Base
  validates :faculty_name, presence: true
  has_many :department
end
