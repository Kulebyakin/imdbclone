class RatingsController < ApplicationController
  before_action :authenticate_user!

  def index
    rating = params[:rating].to_i
    @page = (params[:page] || 1).to_i

    if params[:category].nil?
      @number_of_pages = (Movie.count / MOVIES_PER_PAGE.to_f).ceil
      @movies = Movie.order(title: :asc).paginate(page: params[:page], per_page: MOVIES_PER_PAGE)
    else
      @cat = params[:category].capitalize 
      category_movies = Movie.joins(:category).where("categories.title = ?", @cat)
      @number_of_pages = (category_movies.count / MOVIES_PER_PAGE.to_f).ceil
      @movies = category_movies.paginate(page: params[:page], per_page: MOVIES_PER_PAGE)
    end

    if @page > @number_of_pages || @page < 1
      redirect_to movies_path, alert: "Wrong page number!" 
    else
      if rating < 1 || rating > 10
        redirect_to movies_path, alert: "Wrong rate number!" 
      else

        users_rate = Movie.find(params[:id]).ratings.where(user: current_user)
        if users_rate.present?
          if users_rate.pluck(:rating)[0] == rating
            ratings = users_rate.destroy(users_rate.pluck(:id)[0])
          else
            ratings = users_rate.update(rating: rating)
          end
        else
          ratings = users_rate.build(rating: rating).save
        end

        respond_to do |format|
          if ratings
            format.js { render "movies/rate.js.erb" }
            format.html { redirect_to movie_path, notice: "Your rate was successfully accepted." }
          else
            redirect_to movies_path, status: :unprocessable_entity
          end
        end
      end
    end
  end

end
