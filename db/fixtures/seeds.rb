# -*- coding: utf-8 -*-
require "csv"
# こんな感じに書くといいらしいよ。
faculty_csv = CSV.read('db/fixtures/faculty.csv')
faculty_csv.each.with_index(1) do |row, i|
  faculty_name = row[0]

  Faculty.seed do |s|
    s.id = i
    s.faculty_name = faculty_name
  end
end
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
