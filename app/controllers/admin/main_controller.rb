class Admin::MainController < Admin::BaseController
  skip_before_action :set_active_main_menu_item

  def index
    @category = Category.joins(:movies).uniq
    @movies = Movie.order(title: :asc)
    
  end
end
