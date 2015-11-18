class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def create
    @cat = Cat.new(cats_params)

    if @cat.save
      redirect_to cats_url
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update(cats_params)
      redirect_to cats_url
    else
      render :edit
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  private
  def cats_params
    params.require(:cat).permit(:birth_date, :name, :sex, :color, :description)
  end

end
