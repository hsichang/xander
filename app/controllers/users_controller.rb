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

    redirect_to root_path
  end

  def superuser_dashboard
    @users = User.all
  end

  def create_with_token
    @user = User.find(params[:user])
  end
end
