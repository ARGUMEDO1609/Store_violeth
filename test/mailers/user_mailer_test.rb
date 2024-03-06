require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  def setup
     @user = User.last
  end

  test "welcome" do
     mail = UserMailer.with(user: @user).welcome
     assert_equal "Welcome", mail.subject
     assert_equal [@user.email], mail.to
     assert_equal ["no-replay@violeth.com"], mail.from

     # Buscar específicamente dentro de la parte relevante del HTML del correo electrónico
     html_body = mail.body.parts.find { |part| part.content_type.match(/text\/html/) }.body.decoded
     assert_match /<span class="translation_missing" title="translation missing: en.welcome to violeth_store, username: #{Regexp.escape(@user.username)}">Welcome To Violeth Store<\/span>/, html_body
  end
 end

