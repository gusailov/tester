class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show]

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def find_category
    @categories = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
