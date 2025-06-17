class Admin::CategoriesController < ApplicationController
     def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end
  def show
    @category = Category.find(params[:id])
   end
  def edit; end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "Category created."
    else
      render :new
    end
  end


  def destroy
     @category = Category.find(params[:id])
     @category.tasks.destroy_all
    @category.destroy

    redirect_to admin_categories_path, notice: "Category deleted."
  end

  private

  def category_params
    params.expect(category: [ :name ])
  end
end
