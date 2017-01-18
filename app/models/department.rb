class Department < ActiveRecord::Base
  belongs_to :faculty
  validates :department_name, presence: true
end
