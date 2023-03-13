class OrdersController < ApplicationController

  def index
    binding.pry
    @orders = Order.where(user_id: current_user.id, status: "placed")
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def place_order
    @order = current_order
    @cart = current_order
    @order= Order.find(params[:id])
    @order=@order.status.update(status: "placed")
  end

  def create
    @order = Order.new(order_params)
    @current_order.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to orders_path
  end
  
  private
    def order_params
      params.require(:order).permit(:user_id, :total_price)
    end
end
