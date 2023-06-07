class CartsController < ApplicationController
  before_action :set_cart, only: %i[show destroy add_to_cart remove_from_cart empty_cart update_cart place_order checkout]

  def show
    @cart = current_order
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    @line_item = @order.line_items.find_by(product_id: params[:product_id])
    if @line_item
      @line_item.quantity = @line_item.quantity + params[:quantity].to_i
      @line_item.save
    else
      @order.line_items.create(product_id: params[:product_id], quantity: params[:quantity], price: @product.discounted_price || @product.price)
    end
    @order.save
    flash[:notice] = "Added to cart"
    redirect_to cart_path
  end

  def remove_from_cart
    @line_item = @order.line_items.find(params[:id])
    if @line_item.destroy
      @order.save
      flash[:notice] = "Removed from cart"
      redirect_to cart_path
    end
  end

  def update_cart
    @line_item = @order.line_items.find(params[:id])
    @line_item.quantity = params[:quantity]
    if @line_item.save
      @order.save
      flash[:notice] = "Updated Line Item"
    end
    redirect_to cart_path
  end

  def empty_cart
    @order.destroy if @order.id == session[:order_id]
    session[:order_id] = nil
    flash[:notice] = "Cart is cleared"
    redirect_to cart_path
  end

  def error
    render layout: "simple_layout", template: "carts/error"
  end

  def checkout
  end

  def place_order
    @payment = Payment.new(card_number: params[:card_number], cvv: params[:cvv], expiry_date: "#{params["expiry_date(1i)"]}/#{params["expiry_date(2i)"]}", order_id: @order.id)
    @order.address_id = params[:delivery_address]
    if @order.save
      @order.update(status: "placed")
      flash[:notice] = "Order Placed Successfully"
      redirect_to @order
    end
  end

  private

  def set_cart
    @order = current_order
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
end
