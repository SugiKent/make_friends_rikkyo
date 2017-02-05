require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "send_when_user_create" do
    mail = UserMailer.send_when_user_create
    assert_equal "Send when user create", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
