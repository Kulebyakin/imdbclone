class RatingsController < ApplicationController
  before_action :authenticate_user!

  def index
    movie_id = params[:movie_id]
    rating = params[:rating]

    ratings = Movie.find(movie_id).ratings.build(:user => current_user, :rating => rating)
    if ratings.save
      redirect_to "/movies/#{movie_id}", notice: "Movie was successfully rated."
    else
      redirect_to "/movies/#{movie_id}", status: :unprocessable_entity
    end

  end

  def rating_params
    params.require(:rating).permit(:rating, :movie_id)
  end
end
