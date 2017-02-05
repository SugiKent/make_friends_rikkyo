# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/send_when_user_create
  def send_when_user_create
    UserMailer.send_when_user_create
  end

end
