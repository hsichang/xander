class SessionsController < ApplicationController
  skip_before_filter :require_login

  def index
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username].downcase)

    if !@user.nil? && @user.password == params[:password]
      session[:user_id] = @user.id
      session[:admin] = true
      redirect_to admin_path# if @user.superuser
      # TODO: redirect somewhere if they are in active admin
      #
      # TODO: make a special false clause for inactive members
      #
      # redirect somewhere else if we decide to have non admin routes
      # in the future
    else
      redirect_to login_path, :flash => { :error => "auth_fail" } and return
    end


  end

  def auth_fail
    # TODO make a page for users trying to break in

  end

  def destroy
   session[:user_id] = nil
    reset_session
    redirect_to root_path
  end

end
