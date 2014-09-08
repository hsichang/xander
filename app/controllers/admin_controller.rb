class AdminController < ApplicationController
  before_filter :draft_and_admin?

  def index
    @post = Post.last
  end

  def update
    @post = Post.new
    @post.body = params[:body]
    @post.save
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