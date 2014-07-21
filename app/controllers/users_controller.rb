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

    UserMailer.new_user_request(@user).deliver

    # TODO - redirect to a page that says you will be waiting for admin approval
    redirect_to root_path
  end

  def superuser_dashboard
    @users = User.all
  end

end
