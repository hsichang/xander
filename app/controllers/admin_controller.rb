class AdminController < ApplicationController
  before_filter :deny_access, :unless => :admin?
  # before_filter :deny_access, :unless => :superuser?

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

  def title_new
    @title = Title.new
  end

  def title_create
    @title = Title.new
    @title.name = params[:title][:name]
    @title.order = params[:title][:order]
    @title.visible = params[:title][:visible]

    if @title.save
      redirect_to admin_path and return
    else
      render 'title_new'
    end

  end

  def title_update

  end

  def title_destroy
    @title = Title.find(params[:id])
    @title.deleted = true
    @title.save

    redirect_to admin_path and return
  end

  def post_new
    @post = Post.new
  end

  def post_create
    @post = Post.new
    @post.body = params[:post][:body]
    @post.title_id = # title id
    @post.order = #order
    @post.visible = params[:post][:visible]
    @post.deleted = false

    if @post.save
      redirect_to admin_path and return
    else
      render "post_new"
    end
  end

  protected

  def deny_access
    redirect_to login_path, :flash => { :error => "access_denied"}
  end

  def admin?
    session[:admin] == true
  end

end
