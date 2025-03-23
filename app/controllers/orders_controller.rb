class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id, status: "placed")
  end

  def show
    binding.pry
    unless @order = current_user.orders.find_by_id(params[:id])
      redirect_to error_path
    end
  end

  def new
    @order = Order.new
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
