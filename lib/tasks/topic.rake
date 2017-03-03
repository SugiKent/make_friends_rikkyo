namespace :topic do

  desc "各学科の掲示板を作成します。"
  task create_department_topic: :environment do
    binding.pry
    departments = Department.all
    departments.each do |d|
      description = "#{d.department_name}の掲示板です！みなさん自己紹介や一緒のサークル仲間などを見つけましょう！"
      title = "#{d.department_name}の掲示板"
      p title
      Topic.create(title: title, description: description, belong_type: "department", belong_id: d.id)
    end
  end

end
