class SessionsController < ApplicationController
  skip_before_filter :require_login

  def index
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username].downcase)

    if @user.password == params[:password] && @user.active_admin?
      give_token
    else
      redirect_to admin_path and return
    end

    redirect_to login_path, :flash => { :error => "auth_fail" }
  end

  def auth_fail
    # TODO make a page for users trying to break in

  end

  def destroy
    session[:admin] = false
    redirect_to root_path
  end

end
