class ReviewsController < ApplicationController
  def new
    @product = Product.find_by(code: params[:code])
    @review = Review.new
  end

  def create
    binding.pry
    @product = Product.find_by(code: params[:product_code])
    @review = @product.reviews.new(:rating => params[:rating], :comment => params[:comment], :user_id => current_user.id)
    # @review.user = current_user
    if @review.save
      redirect_to product_path(code: @product.code), notice: "Review created successfully."
    else
      render :new 
    end
  end

  # private

  #   def review_params
  #     params.permit(:rating, :comment, :user_id, :product_id, :code)
  #   end
end
