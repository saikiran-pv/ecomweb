class Admin::ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:all_products, :record, :home, :show]
  before_action :set_product, only: %i[ show update destroy ]
  
  def home
    render :template => "home"
  end

  def index
    if current_user.super_admin? || current_user.staff?
      @products= Product.all
    else current_user.store_admin?
      @store = Store.find(current_user.store_id)
      @products=@store.products
    end
  end

  def show
    @store=Store.find(params[:store_id]) if params[:store_id]
    @product = Product.find_by(code: params[:code])
  end

  def record
    @products=Product.order(rating: :desc).paginate(:page => 1, per_page: 5)
    render :template => "record"
  end

  def new
    @product = Product.new
  end

  def edit
    @product=Product.find(params[:code])
  end

  def create
    @store = Store.find(current_user.store_id)
    @product = Product.create(:product_name => params[:product_name],:price=> params[:price], :description=> params[:description], :discount=> params[:discount], :visibility=> params[:visibility], :image=> params[:image],:rating=> params[:rating],:code=>params[:code])
    if @product.save
      redirect_to admin_products_path, notice: "Added a product successfully"
    end
  end

  def update
    @product = Product.find(params[:code])
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:code])
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find_by(code: params[:code])
    end

    def set_store
      @store = Store.find(params[:store_id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end


    def product_params
      params.permit(:product_name, :price, :description, :discount, :visibility, :image, :rating, :code, :store_id, :category_id)  
    end
end
