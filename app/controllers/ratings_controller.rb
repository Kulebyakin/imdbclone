class RatingsController < ApplicationController
  before_action :authenticate_user!

  def index
    rating = params[:rating].to_i
    @page = (params[:page] || 1).to_i
    @cat = params[:category].capitalize if params[:category].present?
    @number_of_pages = (Movie.count / MOVIES_PER_PAGE.to_f).ceil

    redirect_to movies_path, alert: "Wrong page number!" if @page > @number_of_pages || @page < 1
    
    @movies = Movie.order(title: :asc).paginate(page: params[:page], per_page: MOVIES_PER_PAGE) if @cat.nil?
    @movies = Movie.joins(:category).where("categories.title = ?", @cat).paginate(page: params[:page], per_page: MOVIES_PER_PAGE) if !@cat.nil?

    if rating >= 1 && rating <= 10
      my_rate = Movie.find(params[:id]).ratings.where(user: current_user)
      if my_rate.present?
        if my_rate.pluck(:rating)[0] != rating
          ratings = my_rate.update(rating: rating)
        else
          ratings = my_rate.destroy(my_rate.pluck(:id)[0])
        end
      else
        ratings = my_rate.build(rating: rating).save
      end

      respond_to do |format|
        if ratings
          format.js { render "movies/rate.js.erb" }
          format.html { redirect_to movie_path, notice: "Your rate was successfully accepted." }
        else
          redirect_to movies_path, status: :unprocessable_entity
        end
      end

    else
      redirect_to movies_path, alert: "Wrong rate number!"
    end
  end

end
