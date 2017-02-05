class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_when_user_create.subject
  #
  def send_when_user_create(user)
    @user = user

    mail to: "make.friends.rikkyo@gmail.com", bcc: "ku.so.aka.k@gmail.com", subject: "新しいユーザーが登録されたぞ〜！"
  end
end
