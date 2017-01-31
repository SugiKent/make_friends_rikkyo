# 必ず bundle exec rake db:seed_fuを走らせたあとに
# 開発環境でUserを大量に作りたい時だけ
# User生成
for num in 1..500 do
  faculty = Faculty.where( 'id >= ?', rand(Faculty.first.id..Faculty.last.id) ).first.id

  User.create(
      provider: "twitter",
      uid: "2#{num}8884",
      name: "#{num}aa#{num}太郎",
      nickname: "#{num}twitter#{num}",
      published: num.even?,
      completed: num%3 == 1 ? true : false,
      faculty_id: faculty,
      department_id: Department.where(faculty_id: faculty).order("RAND()").first.id,
      circle_ids: [1,3,4]
    )
  p "#{num}aa#{num}太郎"

end
