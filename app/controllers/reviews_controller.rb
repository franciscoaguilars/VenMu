class ReviewsController < ApplicationController
    def create
        @genre = Genre.find(params[:genre_id])
        @place = Place.find(params[:place_id])
        @review = Review.new(review_params)
        @review.place = @place
        @review.save
        if @review.save
          redirect_to user_path(@review.place)
        else
          redirect_to user_path(@review.place)
        end
    end

    private
    
    def review_params
        params.require(:review).permit(:rating, :content)
    end
end
