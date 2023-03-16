class ReviewsController < ApplicationController
  
  def new
    @product = Product.find_by(code: params[:code])
    @review = Review.new
  end

  def create
    @product = Product.find_by(code: params[:product_code])
    @review = @product.reviews.new(:rating => params[:rating], :comment => params[:comment], :user_id => current_user.id)
    if @review.save
      redirect_to product_path(code: @product.code), notice: "Review created successfully."
    else
      render :new 
    end
  end

end
