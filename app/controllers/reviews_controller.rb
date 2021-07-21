class ReviewsController < ApplicationController

  before_action :set_garden, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
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

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end
end
