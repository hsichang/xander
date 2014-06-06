class AdminController < ApplicationController
  before_filter :deny_access, :unless => :draft_and_admin?

  def index
    @blog = BlogEntry.last
  end

  def update
    @blog = BlogEntry.new
    @blog.billboard_text = params[:billboard_text]
    @blog.save
    redirect_to root_path
  end

  def show

  end

  def login

  end

  protected

  def draft_and_admin?
    redirect_to login_path, :flash => { :error => "access_denied"} unless session[:admin] == true
  end
end
