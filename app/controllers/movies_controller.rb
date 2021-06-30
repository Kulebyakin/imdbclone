class MoviesController < ApplicationController
  before_action :require_admin, only: %i[ new edit update destroy ]
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ expressrate ]

  MOVIES_PER_PAGE = 10

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

  def expressrate
    rating = params[:rating].to_i
    @page = (params[:page] || 1).to_i
    @cat = params[:category].capitalize if params[:category].present?
    @number_of_pages = (Movie.count / MOVIES_PER_PAGE.to_f).ceil

    redirect_to movies_path, alert: "Wrong page number!" if @page > @number_of_pages || @page < 1
    @movies = Movie.order(title: :asc).paginate(page: params[:page], per_page: MOVIES_PER_PAGE) if @cat.nil?
    @movies = Movie.joins(:category).where("categories.title = ?", @cat).paginate(page: params[:page], per_page: MOVIES_PER_PAGE) if !@cat.nil?

    if rating >= 1 && rating <= 10
      if Movie.find(params[:id]).ratings.where(:user => current_user).present?
        redirect_to movies_path, notice: "Your rate is already taken into account."
      else
        ratings = Movie.find(params[:id]).ratings.build(:user => current_user, :rating => rating)
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

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def require_admin
      unless current_user && current_user.admin?
        flash[:alert] = "You are not an admin"
        redirect_to root_path
      end        
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :rating, category_ids:[])
    end
end