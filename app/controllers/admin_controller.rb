class AdminController < ApplicationController
  before_filter :deny_access, :unless => :admin?
  before_filter :deny_access, :unless => :superuser?

  def index
    @titles = Title.all
  end

  def update
    @blog = Post.new
    @blog.billboard_text = params[:billboard_text]
    @blog.save
    redirect_to root_path
  end

  def show

  end

  def new_headline


  end

  def new_post


  end

  protected

  def deny_access
    redirect_to login_path, :flash => { :error => "access_denied"}
  end

  def admin?
    this_user.active_admin?
  end

  def active_superuser?
    this_user.active_superuser?
  end
end
