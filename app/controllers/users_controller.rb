class UsersController < ApplicationController
  skip_before_filter :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.create_token
    @user.save!
    UserMailer.welcome_email(@user).deliver

  end

  def login_with_token
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
    @user.

  end
end
