class ReviewsController < ApplicationController

  def new
    @garden = Garden.find(params[:garden_id])
    @review = Review.new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @review = Review.new(review_params)
    @review.garden = @garden
    if @review.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to garden_path(@review.garden)
  end

  private

  def review_params
    params.require(:review).permit(:content, :garden_id)
  end
end
