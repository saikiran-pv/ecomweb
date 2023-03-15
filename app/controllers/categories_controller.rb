class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(category_name: params[:category_name])
    @products= @category.products
  end

  private
    def set_category
      @category = Category.find_by(category_name: params[:category_name])
    end

    def category_params
      params.require(:category).permit(:category_name, :description)
    end
end
