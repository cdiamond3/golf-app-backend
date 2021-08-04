class RatingsController < ApplicationController
    def index
  
        @ratings = Rating.all
        render json: @ratings
      end

      def create
        @rating = Rating.create rating_params
        render json: @rating
      end
    
      private
    
      def rating_params
        params.require(:rating).permit(:value, :comment_id, :user_id)
      end

end
