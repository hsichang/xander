class UsersController < ApplicationController
  skip_before_filter :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.email_address = params[:user][:email_address]
    @user.save!

    @user.create_token
    @user.save!
    UserMailer.new_user_request(@user).deliver
    # todo: user_mailer is not completely set up to send emails

    redirect_to root_path
  end

  def login_with_token
    # todo: this path has not been set up yet.
    @user = User.find_by_uuid(params[:uuid])

    if @user

      @user = User.new
      @user.uuid = params[:uuid]
      @user.password = params[:password]
      @user.save!

      if @user.save
        redirect_to login_path
      end

    else
      render login_with_token, :flash => { :error => 'not_found' }
    end
  end

  def create_with_token
    @user = User.find(params[:user])
  end
end
