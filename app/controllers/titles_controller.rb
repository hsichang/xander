class TitlesController < ApplicationController
  def new
    @title = Title.new
  end

  def show
  end

  def edit
  end

  def create
    @title = Title.new
    @title.name = params[:name]
    @title.order = params[:order]
    @title.visible = params[:visible]

    binding.pry
    if @title.save
      redirect_to admin_path and return
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end
end
