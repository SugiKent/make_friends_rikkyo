# -*- coding: utf-8 -*-
require "csv"


# 学部
faculty_csv = CSV.read('db/fixtures/faculty.csv')
faculty_csv.each.with_index(1) do |row, i|
  faculty_name = row[0]

  Faculty.seed do |s|
    s.id = i
    s.faculty_name = faculty_name
  end
end

# 学科
department_csv = CSV.read('db/fixtures/department.csv')
department_csv.each.with_index(1) do |row, i|
  department_name = row[0]
  faculty_id = row[1]

  Department.seed do |s|
    s.id = i
    s.department_name = department_name
    s.faculty_id = faculty_id
  end
end


# サークル
circle_csv = CSV.read('db/fixtures/circle.csv')
circle_csv.each.with_index(1) do |row, i|
  circle_name = row[0]
  category = row[1]

  Circle.seed do |s|
    s.id = i
    s.name = circle_name
    s.category = category.to_i
  end
end
