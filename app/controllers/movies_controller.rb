class MoviesController < ApplicationController

  # GET /movies or /movies.json
  def index
    @page = (params[:page] || 1).to_i
    @number_of_pages = (Movie.all.size / MOVIES_PER_PAGE.to_f).ceil
    
    if @page > @number_of_pages || @page < 1
      redirect_to movies_path, alert: "Wrong page number!" 
    else
      @movies = Movie.paginate(page: params[:page], per_page: MOVIES_PER_PAGE)
    end
  end

  def category
    @page = (params[:page] || 1).to_i
    @cat = params[:category].capitalize
    category_movies = Movie.joins(:category).where("categories.title = ?", @cat)
    @number_of_pages = (category_movies.size / MOVIES_PER_PAGE.to_f).ceil

    if @page > @number_of_pages || @page < 1
      redirect_to movies_path, alert: "Wrong page number!"
    else
      @movies = category_movies.paginate(page: params[:page], per_page: MOVIES_PER_PAGE)
      render "index"
    end
  end

  # GET /movies/1 or /movies/1.json
  def show
    @movie = Movie.find(params[:id])
    @current_users_rating ||= @movie.ratings.where(user: current_user).pick(:rating)
    
    if @movie.ratings.any?
      @average_rating = @movie.ratings.average(:rating).round(2) 
      @ratings_count = @movie.ratings.count(:rating)
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :rating, category_ids:[])
    end
end