class UserMailer < ActionMailer::Base
  default from: "hsi.chang@gmail.com"

  def new_user_request(user)
    @user = user
    @login_token = user.login_token
    mail(to: @user.email_address, subject: 'New admin user request for xanderduell.com')
  end

end
