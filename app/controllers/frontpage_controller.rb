class FrontpageController < ApplicationController
  skip_before_filter :require_login

  def index
    @post = Post.last


  end
end
