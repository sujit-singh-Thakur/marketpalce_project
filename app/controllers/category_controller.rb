class CategoryController < ApplicationController
  def new
    @category = Category.new

  end
  def create 
    @category  =  Category.new(param_category={
      category_name: params[:category_name]
      })

      if @category.save
        redirect_to contractor_home_url
      else
        render :new
      end
      
    end 

    private
    def param_category
      params.expect(category: [:category_name])
    end

end
