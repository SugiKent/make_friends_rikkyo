namespace :topic do

  desc "各学科の掲示板を作成します。"
  task create_department_topic: :environment do
    FIRST_POST = "こんにちは！この掲示板では自己紹介や学科生同士の連絡などをしてみてください！この掲示板は同じ学科生にしか見られません〜"
    SECOND_POST = "学科の枠を超えてお話をしたいひとは、掲示板一覧から掲示板を自由に作れます！気になるサークルとか入学前のコミュニケーションに活用してください！"
    THIRD_POST = "それでは、みなさん自由にお話をしましょう！"
    
    departments = Department.all
    departments.each do |d|
      description = "#{d.department_name}の掲示板です！みなさん自己紹介や一緒のサークル仲間などを見つけましょう！"
      title = "#{d.department_name}の掲示板"
      p title
      topic = Topic.create(title: title, description: description, belong_type: "department", belong_id: d.id)

      user = User.find_by(nickname: 'halcala_rikkyo')

      Post.create(topic_id: topic.id, content: FIRST_POST, user_id: user.id)
      Post.create(topic_id: topic.id, content: SECOND_POST, user_id: user.id)
      Post.create(topic_id: topic.id, content: THIRD_POST, user_id: user.id)
    end
  end

end
