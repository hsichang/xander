class SessionsController < ApplicationController
  skip_before_filter :require_login

  def index
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username].downcase)
    if @user
      authenticated = User.authenticate(@user, params[:password])
    end
    if authenticated
      session[:admin] = true
      redirect_to admin_path and return
    end

    redirect_to login_path, :flash => { :error => "auth_fail" }
  end

  def auth_fail

  end

  def destroy
    session[:admin] = false
    redirect_to root_path
  end

end
