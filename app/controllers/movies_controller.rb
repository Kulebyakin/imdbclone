class MoviesController < ApplicationController
  before_action :set_movie, only: :show

  # GET /movies or /movies.json
  def index
    @page = (params[:page] || 1).to_i
    @number_of_pages = (Movie.count / MOVIES_PER_PAGE.to_f).ceil
    
    redirect_to movies_path, alert: "Wrong page number!" if @page > @number_of_pages || @page < 0
    @movies = Movie.order(title: :asc).paginate(page: params[:page], per_page: MOVIES_PER_PAGE)
  end

  def category
    @page = (params[:page] || 1).to_i
    @cat = params[:category].capitalize
    @number_of_pages = (Movie.joins(:category).where("categories.title = ?", @cat).count / MOVIES_PER_PAGE.to_f).ceil

    if @page >= @number_of_pages && @page < 0
      redirect_to movies_path, alert: "Wrong page number!"
    else
      @movies = Movie.joins(:category).where("categories.title = ?", @cat).paginate(page: params[:page], per_page: MOVIES_PER_PAGE)
      render "index"
    end
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :rating, category_ids:[])
    end
end