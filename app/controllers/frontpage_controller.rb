class FrontpageController < ApplicationController
  skip_before_filter :require_login

  def index
   # @blogs = BlogEntry.all
    @blog = BlogEntry.last
  end
end
