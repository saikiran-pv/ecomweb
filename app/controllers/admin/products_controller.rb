class Admin::ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:all_products, :record, :home, :show]
  before_action :set_product, only: %i[ show update destroy ]
  before_action :check_user_permission
  
  def home
    render :template => "home"
  end

  def index
    @products = Product.all
    if params[:store_id]
      @products = Store.find(params[:store_id]).products
    end
    if current_user.store_admin?
      @products = Store.find(current_user.store_id).products
    end
    if params[:category_id]
      @products = @products.where(:category_id => params[:category_id])
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
    @stores = Store.all
    @stores = Store.where(id: current_user.store_id) if current_user.store_admin?
  end

  def edit
    @product=Product.find_by(code: params[:code])
  end

  def create
    @product = Product.new(:product_name => params[:product_name],:price=> params[:price], :description=> params[:description], :discount=> params[:discount], :image=> params[:image],:code=>params[:code],:store_id => params[:store_id], :category_id => params[:category_id])
    # @product.rating = 0
    if @product.save
      redirect_to admin_products_path, notice: "Added a product successfully"
    else
      render :action => 'new'
    end
  end

  def update
    @product = Product.find_by(code: params[:code])
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Updated product successfully"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path,notice: "Product destroyed successfully"
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
      params.permit(:product_name, :price, :description, :discount, :image, :code, :store_id, :category_id)  
    end
end
