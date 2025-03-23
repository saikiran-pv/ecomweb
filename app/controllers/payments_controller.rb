require "stripe"

class PaymentsController < ApplicationController
  def create
    # Set your Stripe API key
    Stripe.api_key = ENV["STRIPE_API_KEY"]

    # Get the order details from the form
    @order = Order.find(params[:order_id])
    @total_price = @order.total_price

    # Create a charge using the Stripe API
    charge = Stripe::Charge.create(
      amount: @amount,
      currency: "INR",
      source: params[:stripeToken]
    )

    # Update the order with the payment details
    @order.update_attributes(
      payment_id: charge.id,
      payment_status: charge.status
    )

    # Redirect to the order confirmation page
    redirect_to orders_path
  end
end
