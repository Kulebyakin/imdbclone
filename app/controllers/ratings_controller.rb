class RatingsController < ApplicationController
  before_action :authenticate_user!

  def index
    movie_id = params[:movie_id]
    rating = params[:rating].to_i

    if rating >= 1 && rating <= 10
      if Movie.find(movie_id).ratings.where(:user => current_user).present?
        redirect_to "/movies/#{movie_id}", notice: "Your rate is already taken into account."
      else
        ratings = Movie.find(movie_id).ratings.build(:user => current_user, :rating => rating)
        if ratings.save
          redirect_to "/movies/#{movie_id}", notice: "Movie was successfully rated."
        else
          redirect_to "/movies/#{movie_id}", status: :unprocessable_entity
        end
      end
    else
      redirect_to "/movies/#{movie_id}", alert: "Wrong rate number!"
    end
  end

  def rating_params
    params.require(:rating).permit(:rating, :movie_id)
  end
end
