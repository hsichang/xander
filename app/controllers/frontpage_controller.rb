class FrontpageController < ApplicationController
  skip_before_filter :require_login

  def index
   # @blogs = BlogEntry.all
   @blog = Post.last unless Post.last.nil?


  end
end
