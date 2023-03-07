class CartsController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: %i[ destroy add_to_cart]
  # before_action :ensure_cart_owner, only: [:show, :edit, :update, :destroy]

  def show
    # @q=Cart.find(params[:id])
    @cart = current_order
    

    # unless @q.user.id == current_user.id
    #   flash[:error] = "You are not authorized to access this cart."
    #   redirect_to cart_error_path
    # end
  end

  def add_to_cart
    binding.pry
    @line_items = @cart.line_items.find_by(:product_id => params[:product_id])  
    @order = Order.find(session[:order_id])
    @product = Product.find(params[:product_id])
    if @order.carts.find_by(product_id: @product.id).present?
      @line_item = @order.carts.find_by(product_id: params[:id])
      @line_item.quantity = @line_item.quantity + 1
    else
      @line_item = Cart.create(product_id: @product.id)
      @order.carts << @line_item 
      flash[:notice] = "Added to cart"
    end
    redirect_to cart_path(@current_order)
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_order)
  end  
  

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to cart_url, notice: 'Your cart is currently empty' }
      format.json { head :no_content }
    end
  end
    
  def error
    @cart= Cart.new
  end

  private
    def set_cart
      @cart = current_order
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_line_item
      @line_item = LineItem.find(params[:line_item_id])
    end

    def cart_params
      params.require(:cart).permit(:user_id)
    end

    # def invalid_cart
    #   logger.error "Attempt to access invalid cart #{params[:id]}"
    #   render :template => "invalid_page", notice: 'Invalid cart'
    # end

    # def ensure_cart_owner
    #   @cart = Cart.find(params[:id])
    #   unless @cart.user == current_user
    #     flash[:error] = "You are not authorized to access this cart."
    #     render :template => "invalid_page"
    #   end
    # end
end


#-------------------------------------------------------
