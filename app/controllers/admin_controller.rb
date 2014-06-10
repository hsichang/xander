class AdminController < ApplicationController
  before_filter :deny_access, :unless => :draft_and_admin?

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

  def login

  end

  def new_headline


  end

  def new_post


  end

  protected

  def deny_access
    redirect_to login_path, :flash => { :error => "access_denied"}
  end

  def draft_and_admin?
    session[:admin] == true
  end
end
