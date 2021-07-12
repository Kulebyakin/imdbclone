class Admin::MainController < Admin::BaseController
  def index
    @category = Category.joins(:movies).uniq
    @movies = Movie.order(title: :asc)
    
  end
end
