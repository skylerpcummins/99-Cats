class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new(cats_params)
  end

  private
  def cats_params
    params.require(:cats).permit(:birth_date, :name, :sex, :color, :description)
  end

end
