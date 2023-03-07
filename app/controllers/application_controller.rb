class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :address, :additional_address])
  end
  
  private
    def current_order
      if session[:order_id]
        cart = Order.find_by(:id => session[:order_id], :user_id => current_user.id)
        if cart.present?
          @current_order = cart
        else
          session[:order_id] = nil
        end
      end
    
      if session[:order_id] == nil
        @current_order = Order.find_by(user_id: current_user.id)
        @current_order ||= Order.create(user_id: current_user.id)
        session[:order_id] = @current_order.id
      end
      @current_order
    end
end
    # def current_cart
    #   if session[:cart_id]
    #     cart = Cart.find_by(:id => session[:cart_id], :user_id => current_user.id)
    #     if cart.present?
    #       @current_cart = cart
    #     else
    #       session[:cart_id] = nil
    #     end
    #   end

    #   if session[:cart_id] == nil
    #     @current_cart = Cart.find_by(user_id: current_user.id)
    #     @current_cart ||= Cart.create(user_id: current_user.id)
    #     session[:cart_id] = @current_cart.id
    #   end
    #   @current_cart
    # end



