class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  # before_action :set_store, only: %i[ new edit create update destroy]
  # before_action :set_category, only: %i[ new edit create update destroy]

  def index
    @products=Product.all
    @products=@products.paginate(:page => 1, :per_page => params[:per_page])
    # @products=@products.paginate(:page => params[:page])
  end

  def all_products
    @products= Product.all
    @products=@products.paginate(:page => 1, :per_page => params[:per_page])
    if params[:sort_price] == "Price - low to high"
      @products=Product.order(price: :asc).paginate(:page => params[:page], per_page: params[:per_page]) 
    elsif params[:sort_price]  == "Price - high to low"
      @products=Product.order(price: :desc).paginate(:page => params[:page], per_page: params[:per_page]) 
    elsif params[:sort_price]  == "Relevance"  
      @products=Product.paginate(:page => params[:page], per_page: params[:per_page]) 
    end
  end

  def show
    # @store=Store.find(params[:store_id]) if params[:store_id]
    @product = Product.find_by(code: params[:code])
  end

  def new
    @product = Product.new
  end

  def edit
    @product=Product.find(params[:code])
  end

  def create
    @product = Product.create(:product_name => params[:product_name],:price=> params[:price], :description=> params[:description], :discount=> params[:discount], :visibility=> params[:visibility], :image=> params[:image],:rating=> params[:rating],:code=>params[:code])
    if @product.save
      redirect_to products_path
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
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
