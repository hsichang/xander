class FrontpageController < ApplicationController
  skip_before_filter :require_login

  def index
    @titles = Title.all


  end
end
