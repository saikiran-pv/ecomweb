class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @store=Store.find(params[:store_id])
    @products=@store.products.paginate(:page => params[:page])
  end

  def all_products
    @products=Product.paginate(:page => params[:page], per_page: 3)
  end


  def search 
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end
  

  # GET /products/1 or /products/1.json
  def show
    @store=Store.find(params[:store_id]) if params[:store_id]
    @product=Product.find(params[:id])
  end

  # GET /products/new
  def new
    @store=Store.find(params[:store_id])
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @store=Store.find(params[:store_id])
    @product=@store.products.find(params[:id])
  end

  # POST /products or /products.json
  def create
    @store=Store.find(params[:store_id])
    @product = @store.products.create(:product_name => params[:product_name],:price=> params[:price], :description=> params[:description], :discount=> params[:discount], :visibility=> params[:visibility], :image=> params[:image],:rating=> params[:rating])
    if @product.save
      redirect_to store_products_path(@store)
    end
    # respond_to do |format|
    #   if @product.save
    #     format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /products/1 or /products/1.json
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

  # DELETE /products/1 or /products/1.json
  def destroy
    @store = Store.find(params[:store_id])
    @product= @store.products.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to stores_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:product_name, :price, :description, :discount, :visibility, :image,:rating)  
    end
end
