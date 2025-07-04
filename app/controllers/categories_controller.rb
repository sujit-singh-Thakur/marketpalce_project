class CategoriesController < ApplicationController
  before_action :set_category, only:[:show,:edit]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category created."
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    if  @category. update(category_params)
     redirect_to categories_path, notice: "category updated successfully."
     else
     render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.tasks.destroy_all
    @category.destroy
    redirect_to categories_path, notice: "Category deleted."
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.expect(category: [ :category_name ])
  end
end
