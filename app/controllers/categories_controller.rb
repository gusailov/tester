class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
