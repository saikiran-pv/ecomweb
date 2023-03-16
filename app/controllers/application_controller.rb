class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      # Permit the `subscribe_newsletter` parameter along with the other
      # sign up parameters.
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number,:password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number,:password])
    end
  
  private
    def current_order
      if session[:order_id]
        order = Order.find_by(:id => session[:order_id], :user_id => current_user.id, :status => "in_cart")
        if order.present?
          @current_order = order
        else
          session[:order_id] = nil
        end
      end
    
      if session[:order_id] == nil
        @current_order = Order.find_by(user_id: current_user.id, :status => "in_cart")
        @current_order ||= Order.create(user_id: current_user.id, :status => "in_cart")
        session[:order_id] = @current_order.id
      end
      @current_order
    end

    def check_user_permission
      unless current_user.is_admin?
        flash[:error] = "You Don't have permission to access this page."
        redirect_to error_path
      end
    end
end
