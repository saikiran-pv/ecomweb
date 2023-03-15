class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:all_products, :record, :home, :show]
  before_action :set_product, only: %i[ show update destroy ]
  
  def home
    render :template => "home"
  end

  def index
    @products=Product.all
    @products=@products.paginate(:page =>  params[:page], :per_page => params[:per_page])
  end

  def all_products
    @products= Product.all
    @per_page = params[:per_page] if params[:per_page]
    @sort_price = params[:sort_price] if params[:sort_price]
    @products=@products.paginate(:page =>  params[:page], :per_page => params[:per_page])
    if @sort_price == "Price - low to high"
      @products=Product.order(price: :asc).paginate(:page => params[:page], per_page: params[:per_page]) 
    elsif @sort_price  == "Price - high to low"
      @products=Product.order(price: :desc).paginate(:page => params[:page], per_page: params[:per_page]) 
    elsif @sort_price  == "Relevance"  
      @products=Product.paginate(:page => params[:page], per_page: params[:per_page]) 
    elsif @sort_price == "Highest rating"
      @products=Product.order(rating: :desc).paginate(:page => params[:page], per_page: params[:per_page])
    end

    @category_id = params[:category_id] if params[:category_id] && params[:category_id].present?
    @products = @products.where(category_id: @category_id) if @category_id

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
    binding.pry
    @product = Product.create(:product_name => params[:product_name],:price=> params[:price], :description=> params[:description], :discount=> params[:discount], :visibility=> params[:visibility], :image=> params[:image],:code=>params[:code])
    if @product.save
      redirect_to products_path
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
      params.require(:product).permit(:product_name, :price, :description, :discount, :visibility, :image, :rating, :code, :store_id, :category_id)  
    end
end
