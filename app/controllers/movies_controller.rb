class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show ]
  before_action :authenticate_user!, only: %i[ rate ]

  MOVIES_PER_PAGE = 20

  # GET /movies or /movies.json
  def index
    @category = Category.joins(:movies).uniq
    @page = (params[:page] || 1).to_i
    @number_of_pages = (Movie.count / MOVIES_PER_PAGE.to_f).ceil
    
    redirect_to movies_path, alert: "Wrong page number!" if @page > @number_of_pages || @page < 0
    @movies = Movie.order(title: :asc).paginate(page: params[:page], per_page: MOVIES_PER_PAGE)
  end

  def category
    @category = Category.joins(:movies).uniq
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

  def rate
    rating = params[:rating].to_i
    @page = (params[:page] || 1).to_i
    @cat = params[:category].capitalize if params[:category].present?
    @number_of_pages = (Movie.count / MOVIES_PER_PAGE.to_f).ceil

    redirect_to movies_path, alert: "Wrong page number!" if @page > @number_of_pages || @page < 1
    @movies = Movie.order(title: :asc).paginate(page: params[:page], per_page: MOVIES_PER_PAGE) if @cat.nil?
    @movies = Movie.joins(:category).where("categories.title = ?", @cat).paginate(page: params[:page], per_page: MOVIES_PER_PAGE) if !@cat.nil?

    if rating >= 1 && rating <= 10
      if Movie.find(params[:id]).ratings.where(user: current_user).present?
        ratings = Movie.find(params[:id]).ratings.where(user: current_user).update(rating: rating)
        respond_to do |format|
          if ratings
            format.js
            format.html { redirect_to movie_path, notice: "Movie was successfully rated." }
          else
            redirect_to movies_path, status: :unprocessable_entity
          end
        end
      else
        ratings = Movie.find(params[:id]).ratings.where(user: current_user).build(rating: rating)
        respond_to do |format|
          if ratings.save
            format.js
            format.html { redirect_to movie_path, notice: "Movie was successfully rated." }
          else
            redirect_to movies_path, status: :unprocessable_entity
          end
        end
      end
    else
      redirect_to movies_path, alert: "Wrong rate number!"
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