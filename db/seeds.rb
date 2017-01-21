# 必ず bundle exec rake db:seed_fuを走らせたあとに
# 開発環境でUserを大量に作りたい時だけ
# User生成
for num in 1..500 do
  faculty = Faculty.where( 'id >= ?', rand(Faculty.first.id..Faculty.last.id) ).first.id

  User.create(
      name: "#{num}aa#{num}太郎",
      twitter_id: "#{num}twitter#{num}",
      published: num.even?,
      faculty_id: faculty,
      department_id: Department.where(faculty_id: faculty).order("RAND()").first.id
    )
  p "#{num}aa#{num}太郎"
end
