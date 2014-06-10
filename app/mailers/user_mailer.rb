class UserMailer < ActionMailer::Base
  default from: "hsi.chang@gmail.com"

  def new_user_request(user)
    @user = user
    mail(:to => 'hsi.chang@gmail.com', :subject => 'New admin user request for xanderduell.com')
  end

end
