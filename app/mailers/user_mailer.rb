class UserMailer < ActionMailer::Base
  default from: "hsi.chang@gmail.com"

  def new_user_request(user, email_address)
    @email = email_address
    @user = User.new
    @user.uuid = user.create_token
    @user.save!
  end

end
